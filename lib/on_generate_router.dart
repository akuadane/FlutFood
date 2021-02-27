import 'package:flut_food/item/screens/home.dart';
import 'package:flut_food/user/screens/login.dart';
import 'package:flut_food/user/screens/signup.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class OnGenerateRouter {
  static Route onGenerateRouter(RouteSettings settings) {
    if (settings.name == HOME) {
      return MaterialPageRoute(builder: (context) => HomePage());
    } else if (settings.name == LOGIN) {
      return MaterialPageRoute(builder: (context) => LoginPage());
    } else if (settings.name == SIGN_UP) {
      return MaterialPageRoute(builder: (context) => SignupPage());
    }

    return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
