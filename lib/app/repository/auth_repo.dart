import 'package:app_using_provider/app/res/app_urls.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class AuthRepo {
  final Baseapiservices _apiServices = Networkapiservices();

  Future<dynamic> login(dynamic data) async {
    print(data);
    print(AppUrls.loginEndpoint);

    var response =
        await _apiServices.postApiResponse(AppUrls.loginEndpoint, data);
    return response;
  }
}
