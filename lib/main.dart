import 'package:app_using_provider/app/view_model/auth_view_model/login_view_model.dart';
import 'package:app_using_provider/app/view_model/provider/examples_provider/container_example_provider.dart';
import 'package:app_using_provider/app/view_model/provider/examples_provider/count_example_provider.dart';
import 'package:app_using_provider/app/view_model/provider/examples_provider/favourite_example_provider.dart';
import 'package:app_using_provider/app/utils/app_routes/routes.dart';
import 'package:app_using_provider/app/utils/app_routes/routesName.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/view_model/all_user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountExampleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContainerExampleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouriteExampleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllUserViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        onGenerateRoute: Routes.generateRoutes,
        initialRoute: RoutesName.homescreen,
        // home: Homepage(),
      ),
    );
  }
}
