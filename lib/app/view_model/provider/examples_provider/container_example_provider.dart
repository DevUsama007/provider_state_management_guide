import 'package:flutter/widgets.dart';

class ContainerExampleProvider with ChangeNotifier {
  double _containerradius = 20.0;
  double _containerOpacity=1.0;


  double get containerradius => _containerradius;
  double get containerOpacity=>_containerOpacity;
  changeRadius(double newradius) {
    _containerradius = newradius;
    notifyListeners();
  }
  changeOpacity(double newOpacity){
    _containerOpacity=newOpacity;
    notifyListeners();
  }
}
