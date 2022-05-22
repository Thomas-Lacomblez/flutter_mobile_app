import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';

import '../pages/register_page.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toogleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toogleScreens);
    }
    else {
      return RegisterPage(showLoginPage: toogleScreens);
    }
  }
}