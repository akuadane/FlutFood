import 'package:flut_food/widgets/logo_widget.dart';
import 'package:flut_food/widgets/singup_container.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              flutFoodLogo,
              Expanded(
                child: SignupContainer(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
