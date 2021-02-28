import 'package:flut_food/item/item.dart';
import 'package:flut_food/user/data_provider/data_provider.dart';
import 'package:flut_food/user/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flut_food/app.dart';
import 'package:http/http.dart' as http;

import 'bloc_observer.dart';
import 'order/data_provider/order_provider.dart';
import 'order/repository/order_repository.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();
  final ItemRepository itemRepository = ItemRepository(
    dataProvider: ItemDataProvider(
      httpClient: http.Client(),
    ),
  );

  final UserRepository userRepository = UserRepository(
    UserProvider(http.Client()),
  );

  final OrderRepository orderRepository =
      OrderRepository(OrderProvider(http.Client()));

  runApp(FlutFood(
    itemRepository: itemRepository,
    userRepository: userRepository,
    orderRepository: orderRepository,
  ));
}
