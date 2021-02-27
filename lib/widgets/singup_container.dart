import 'package:flut_food/colors.dart';
import 'package:flut_food/constants.dart';
import 'package:flut_food/services/container_clipper.dart';
import 'package:flut_food/user/bloc/bloc.dart';
import 'package:flut_food/user/model/models.dart';
import 'package:flut_food/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupContainer extends StatefulWidget {
  @override
  _SignupContainerState createState() => _SignupContainerState();
}

class _SignupContainerState extends State<SignupContainer> {
  String username = '';
  String password = '';
  String fullname = '';
  bool visible = false;

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
        color: kSecondaryColor,
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
                    'Sign Up',
                    style: kButtonTextStyle.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) return "Name can't be left empty";

                        return null;
                      },
                      style: kTextFormFieldStyle,
                      decoration: kInputFieldDecoration.copyWith(
                          hintText: 'Enter Full name',
                          focusColor: Colors.white,
                          labelText: 'Full name',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          )),
                      onChanged: (value) => fullname = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "Username can't be left empty";

                        return null;
                      },
                      style: kTextFormFieldStyle,
                      decoration: kInputFieldDecoration.copyWith(
                          hintText: 'Enter Username',
                          labelText: 'Username',
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.white,
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
                      style: kTextFormFieldStyle,
                      obscureText: visible ? false : true,
                      decoration: kInputFieldDecoration.copyWith(
                          hintText: 'Enter password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                              onPressed: toggleVisibility,
                              icon: visible
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    )),
                          labelText: 'Password'),
                      onChanged: (value) => password = value,
                    ),
                  ),
                  CheckboxListTile(
                    value: true,
                    onChanged: (value) {},
                    title: Text(
                      'Yes! I Agree all Terms and Condtions',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RoundedButton(
                      text: 'Sign Up',
                      onPressed: () {
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          final event = UserSignUp(User(
                            userName: username,
                            password: password,
                            email: "sample@gmail.com",
                            phone: "0940232452",
                            fullName: fullname,
                          ));

                          BlocProvider.of<UserBloc>(context).add(event);
                        }
                      },
                      color: Colors.white,
                      labelColor: kSecondaryColor,
                    ),
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
