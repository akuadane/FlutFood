import 'package:flut_food/item/item.dart';
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
  runApp(FlutFood(
    itemRepository: itemRepository,
  ));
}
