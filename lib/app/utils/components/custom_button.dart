import 'package:app_using_provider/app/utils/app_routes/routesName.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  String routeName;
  bool ontapvalid;
  VoidCallback? onPress;
  CustomButton(
      {super.key,
      required this.title,
      required this.routeName,
      this.onPress,
      this.ontapvalid = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            minimumSize: WidgetStatePropertyAll(
                Size(MediaQuery.of(context).size.width * 0.9, 40)),
            backgroundColor: WidgetStatePropertyAll(Colors.amber)),
        onPressed: ontapvalid
            ? onPress
            : () {
                Navigator.pushNamed(context, routeName.toString());
              },
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ));
  }
}
