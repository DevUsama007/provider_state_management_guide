import 'package:app_using_provider/app/utils/app_routes/routesName.dart';
import 'package:app_using_provider/app/view/auth/loginView.dart';
import 'package:app_using_provider/app/view/examples_view/container_example_ui.dart';
import 'package:app_using_provider/app/view/examples_view/count_example_ui.dart';
import 'package:app_using_provider/app/view/examples_view/fouvrite_example_view.dart';
import 'package:app_using_provider/app/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_using_provider/app/view/all_user_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    print("Navigating to: ${settings.name}"); // Debug log
    switch (settings.name) {
      case RoutesName.homescreen:
        return MaterialPageRoute(
          builder: (context) => Homepage(),
        );
      case RoutesName.countExampleUime:
        return MaterialPageRoute(
          builder: (context) => CountExampleUi(),
        );

      case RoutesName.containerExampleUi:
        return MaterialPageRoute(
          builder: (context) => ContainerExampleUi(),
        );
      case RoutesName.fouvriteExampleView:
        return MaterialPageRoute(
          builder: (context) => FouvriteExampleView(),
        );
      case RoutesName.loginView:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      case RoutesName.allUserView:
        return MaterialPageRoute(
          builder: (context) => AllUserView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No Routes defined'),
              ),
            );
          },
        );
    }
  }
}
