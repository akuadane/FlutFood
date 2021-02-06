import 'package:flut_food/app.dart';
import 'package:flut_food/widgets/login_container.dart';
import 'package:flut_food/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flut_food/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLoginMainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Row(),
              flutFoodLogo,
              Expanded(child: LoginContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
