import 'package:flut_food/colors.dart';
import 'package:flut_food/constants.dart';
import 'package:flut_food/services/container_clipper.dart';
import 'package:flut_food/user/bloc/bloc.dart';
import 'package:flut_food/user/data_provider/data_provider.dart';
import 'package:flut_food/user/model/models.dart';
import 'package:flut_food/user/screens/signup.dart';
import 'package:flut_food/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class LoginContainer extends StatefulWidget {
  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  bool visible = false;
  String username = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();

  void toggleVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ContainerClipper(),
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 32.0, right: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login',
                    style: kButtonTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "Username can't be left empty";

                        return null;
                      },
                      style:
                          kTextFormFieldStyle.copyWith(color: Colors.black54),
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Enter username',
                          focusColor: kSecondaryColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kSecondaryColor, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kSecondaryColor, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: kSecondaryColor,
                          )),
                      onChanged: (value) => username = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "Password can't be left empty";

                        return null;
                      },
                      style:
                          kTextFormFieldStyle.copyWith(color: Colors.black54),
                      obscureText: visible ? false : true,
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Enter password',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kSecondaryColor, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kSecondaryColor, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusColor: kSecondaryColor,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: kSecondaryColor,
                          ),
                          suffixIcon: IconButton(
                              onPressed: toggleVisibility,
                              icon: visible
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: kSecondaryColor,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: kSecondaryColor,
                                    )),
                          labelText: 'Password'),
                      onChanged: (value) => password = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RoundedButton(
                        text: 'Login',
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (form.validate()) {
                            final event =
                                UserSignInWithUsername(username, password);
                            BlocProvider.of<UserBloc>(context).add(event);
                          }
                        },
                        color: kSecondaryColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: kSecondaryColor),
                        ),
                      )
                    ],
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
