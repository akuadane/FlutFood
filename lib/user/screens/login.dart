import 'package:flut_food/app.dart';
import 'package:flut_food/item/bloc/bloc.dart';
import 'package:flut_food/routes.dart';
import 'package:flut_food/user/bloc/bloc.dart';
import 'package:flut_food/widgets/login_container.dart';
import 'package:flut_food/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flut_food/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<UserBloc>(context).add(UserSignInFromCache());
    return WillPopScope(
      onWillPop: () => SystemNavigator.pop(),
      child: Scaffold(
        backgroundColor: kLoginMainColor,
        body: BlocListener<UserBloc, UserState>(
          listener: (context, userState) async {
            if (userState is UserFailedToSignIn ||
                userState is UserGeneralFailure) {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Incorrect user credential.")));
            } else if (userState is UserSuccessfullySignedIn) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt("USER_ID", userState.user.id);

              Navigator.pushNamed(context, HOME_HOLDER);
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: [
                  Row(),
                  flutFoodLogo,
                  Expanded(
                    child: LoginContainer(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
