import 'package:flut_food/item/item.dart';
import 'package:flut_food/user/data_provider/data_provider.dart';
import 'package:flut_food/user/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flut_food/app.dart';
import 'package:http/http.dart' as http;

import 'bloc_observer.dart';

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

  runApp(FlutFood(
    itemRepository: itemRepository,
    userRepository: userRepository,
  ));
}
