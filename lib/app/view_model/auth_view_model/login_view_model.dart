import 'dart:convert';

import 'package:app_using_provider/app/data/network/BaseApiServices.dart';
import 'package:app_using_provider/app/data/network/NetworkApiServices.dart';
import 'package:app_using_provider/app/data/response/status.dart';
import 'package:app_using_provider/app/repository/auth_repo.dart';
import 'package:app_using_provider/app/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  Baseapiservices _apiServices = Networkapiservices();
  String _loginScreen = 'Login';
  String _error = '';

  String get loginScreen => _loginScreen;
  String get error => _error;

  Status _status = Status.COMPLETED;
  changeStatus(Status value) {
    _status = value;
    notifyListeners();
  }

  updateError(String error) {
    _error = error;
    notifyListeners();
  }

  Status get status => _status;
  // login logic here
  validateFields(String email, String password, BuildContext context) {
    if (email.isEmpty) {
      updateError("Email is required");
      changeStatus(Status.ERROR);
      Utils.snackBar("Email is required", context);
    } else if (password.isEmpty) {
      updateError("Password is required");
      changeStatus(Status.ERROR);
      Utils.snackBar("Password is required", context);
    } else {
      login(email, password, context);
    }
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    changeStatus(Status.LOADING);
    updateError("");
    try {
      print(email);
      print(password);
      Map data = {
        'email': email,
        'password': password,
      };
      print(jsonEncode(data));
      var response = AuthRepo().login(jsonEncode(data)).then(
        (value) {
          Utils.snackBar('Login Successful ${value.toString()}', context);
          changeStatus(Status.COMPLETED);
        },
      ).onError(
        (error, stackTrace) {
          print("Error: $error");
          Utils.snackBar('Login Failed \n ${error.toString()}', context);
          changeStatus(Status.ERROR);
          updateError(error.toString());
        },
      );
    } catch (e) {
      Utils.snackBar('Login Failed\n ${e.toString()}', context);
      changeStatus(Status.ERROR);
      updateError(e.toString());
    }
  }
}
