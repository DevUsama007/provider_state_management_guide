import 'dart:convert';
import 'dart:io';

import 'package:app_using_provider/app/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

import '../app_exception/app_exceptions.dart';

class Networkapiservices extends Baseapiservices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(headers: {
        "Content-Type": "application/json",
        'x-api-key': 'reqres-free-v1'
      }, Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException(
          message: "No Internet Connection. Please check your connection.");
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.post(headers: {
        "Content-Type": "application/json",
        'x-apikey-': 'reqres-free-v1'
      }, Uri.parse(url), body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException(
          message: "No Internet Connection. Please check your connection.");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(message: "Bad request");
      case 401:
      case 403:
        throw UnauthorisedException(message: "Unauthorised request");
      case 404:
        throw NotFoundException(message: "Resource not found");
      case 500:
      default:
        throw FetchDataException(
            message:
                "Error occurred while communicating with server with status code : ${response.statusCode}");
    }
  }
}
