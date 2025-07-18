import 'package:app_using_provider/app/data/network/BaseApiServices.dart';
import 'package:app_using_provider/app/data/network/NetworkApiServices.dart';
import 'package:app_using_provider/app/model/allUsersModel.dart';
import 'package:app_using_provider/app/res/app_urls.dart';

class AllUserRepo {
  Baseapiservices _apiServices = Networkapiservices();
  Future<AllUsersModel> allUserRepo() async {
    dynamic response =
        await _apiServices.getApiResponse(AppUrls.fetchDataEndpoint);
    return AllUsersModel.fromJson(response);
  }
}
