import 'package:flut_food/item/screens/home.dart';
import 'package:flut_food/item/screens/index.dart';
import 'package:flut_food/item/screens/item_detail.dart';
import 'package:flut_food/user/screens/login.dart';
import 'package:flut_food/user/screens/profile.dart';
import 'package:flut_food/user/screens/signup.dart';
import 'package:flutter/material.dart';
import 'item/models/models.dart';
import 'order/models/order.dart';
import 'order/screens/order_detail_screen.dart';
import 'routes.dart';

class OnGenerateRouter {
  static Route onGenerateRouter(RouteSettings settings) {
    if (settings.name == HOME) {
      return MaterialPageRoute(builder: (context) => HomePage());
    } else if (settings.name == LOGIN) {
      return MaterialPageRoute(builder: (context) => LoginPage());
    } else if (settings.name == SIGN_UP) {
      return MaterialPageRoute(builder: (context) => SignupPage());
    } else if (settings.name == HOME_HOLDER) {
      return MaterialPageRoute(builder: (context) => HomeHolder());
    } else if (settings.name == PROFILE) {
      return MaterialPageRoute(builder: (context) => ProfilePage());
    } else if (settings.name == ITEM_DETAIL) {
      final Item item = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => ItemDetail(
                item: item,
              ));
    } else if (settings.name == ORDER_DETAIL) {
      final Order order = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => OrderDetailScreen(order),
      );
    }

    return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
