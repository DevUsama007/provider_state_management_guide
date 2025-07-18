import 'package:app_using_provider/app/utils/components/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../view_model/auth_view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 131, 244, 232).withOpacity(0.9),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(loginProvider.loginScreen,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.8),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    canRequestFocus: true,
                    onSubmitted: (value) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Consumer<LoginViewModel>(
                    builder: (context, value, child) {
                      return value.status == Status.LOADING
                          ? CircularProgressIndicator()
                          : CustomButton(
                              title: 'Login',
                              routeName: "",
                              ontapvalid: true,
                              onPress: () {
                                value.login(emailController.text,
                                    passwordController.text, context);
                              },
                            );
                    },
                  ),
                  SizedBox(height: 20),
                  loginProvider.status == Status.ERROR
                      ? Consumer<LoginViewModel>(
                          builder: (context, value, child) {
                            return Text(value.error);
                          },
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
