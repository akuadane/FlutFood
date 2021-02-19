// File defines app wide settings and themes


import 'package:flut_food/item/bloc/bloc.dart';
import 'package:flut_food/item/repository/item_repository.dart';

import 'package:flut_food/pages/food_detail.dart';

import 'package:flut_food/pages/login.dart';
import 'package:flut_food/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flut_food/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutFood extends StatelessWidget {
  final ItemRepository itemRepository;
  FlutFood({@required this.itemRepository}) : assert(itemRepository != null);
  @override
  Widget build(BuildContext context) {

    return RepositoryProvider.value(
      value: this.itemRepository,
      child: BlocProvider(
          create: (context) =>
              ItemBloc(itemRepository: this.itemRepository)..add(ItemLoad()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(), //LoginPage(),
          )),

    );
  }
}
