import 'package:app_using_provider/app/model/allUsersModel.dart';
import 'package:app_using_provider/app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../data/response/status.dart';
import '../repository/all_user_repo.dart';

class AllUserViewModel with ChangeNotifier {
  AllUsersModel? _allUsersModel;
  AllUsersModel? get allUsersModel => _allUsersModel;
  String _error = '';
  String get error => _error;
  Status _status = Status.COMPLETED;
  Status get status => _status;
  changeStatus(Status value) {
    _status = value;
    notifyListeners();
  }

  updateError(String error) {
    _error = error;
    notifyListeners();
  }

  Future<void> fetchAllUsers(BuildContext context) async {
    try {
      changeStatus(Status.LOADING);
      // Assuming AllUserRepo is already defined and fetches the data
      var response = await AllUserRepo().allUserRepo().then(
        (value) {
          _allUsersModel = value;
          print(_allUsersModel!.data?[0].email.toString());
          notifyListeners();
          changeStatus(Status.COMPLETED);
          Utils.snackBar('Fetched all users successfully', context);
        },
      ).onError(
        (error, stackTrace) {
          Utils.snackBar("Error fetching all users ${error}", context);
          updateError(error.toString());
          changeStatus(Status.ERROR);
        },
      );
    } catch (e) {
      Utils.snackBar("Error fetching all users ${e}", context);
      updateError(error.toString());
      changeStatus(Status.ERROR);
      // Handle error appropriately, maybe set an error state
    }
  }
}
