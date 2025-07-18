import 'package:app_using_provider/app/utils/app_routes/routesName.dart';
import 'package:app_using_provider/app/utils/components/custom_button.dart';
import 'package:app_using_provider/app/utils/utils.dart';
import 'package:app_using_provider/app/view/examples_view/container_example_ui.dart';
import 'package:app_using_provider/app/view/examples_view/count_example_ui.dart';
import 'package:app_using_provider/app/view/examples_view/fouvrite_example_view.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Provider StateManagement"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                  title: 'Count Example',
                  routeName: RoutesName.countExampleUime),
              SizedBox(height: 20),
              CustomButton(
                  title: 'Container Example Ui',
                  routeName: RoutesName.containerExampleUi),
              SizedBox(height: 20),
              CustomButton(
                  title: 'fovourite Example Ui',
                  routeName: RoutesName.fouvriteExampleView),
              SizedBox(height: 20),
              CustomButton(
                title: 'show',
                ontapvalid: true,
                onPress: () {
                  Utils.flushBarErrorMessage(context, "flushbar removed ");
                  Utils.snackBar("snackbar removed ", context);
                  // Utils.toastMessage("removed ");
                },
                routeName: '',
              ),
              SizedBox(height: 20),
              CustomButton(
                  title: 'LOGIN SCREEN', routeName: RoutesName.loginView),
              SizedBox(height: 20),
              CustomButton(
                  title: 'All Users screen', routeName: RoutesName.allUserView)
            ],
          ),
        ),
      ),
    );
  }
}
