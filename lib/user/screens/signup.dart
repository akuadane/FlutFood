import 'package:flut_food/routes.dart';
import 'package:flut_food/user/bloc/bloc.dart';
import 'package:flut_food/widgets/logo_widget.dart';
import 'package:flut_food/widgets/singup_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, userState) {
          if (userState is UserGeneralFailure) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(userState.error)));
          } else if (userState is UserSuccessfullySignedIn) {
            Navigator.pushNamed(context, HOME_HOLDER);
          }
        },
        child: SafeArea(
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
      ),
    );
  }
}
