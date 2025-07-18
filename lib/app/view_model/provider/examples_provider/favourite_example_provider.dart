import 'package:flutter/material.dart';

class FavouriteExampleProvider with ChangeNotifier {
  List _fovouriteList = [];

  List get favouriteList => _fovouriteList;

  addFavourite(int itemindex) {
    _fovouriteList.add(itemindex);
    notifyListeners();
  }

  removeFavourite(int itemindex) {
    _fovouriteList.remove(itemindex);
    notifyListeners();
  }
}
