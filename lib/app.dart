// File defines app wide settings and themes

import 'package:flut_food/pages/food_detail.dart';
import 'package:flut_food/pages/login.dart';
import 'package:flut_food/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flut_food/pages/home.dart';

class FlutFood extends StatefulWidget {
  @override
  _FlutFoodState createState() => _FlutFoodState();
}

class _FlutFoodState extends State<FlutFood> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: FoodDetail(),
    );
  }
}
