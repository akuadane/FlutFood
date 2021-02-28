// File defines app wide settings and themes

import 'package:flut_food/cart/bloc/cart_bloc.dart';
import 'package:flut_food/item/bloc/bloc.dart';
import 'package:flut_food/item/repository/item_repository.dart';
import 'package:flut_food/on_generate_router.dart';
import 'package:flut_food/routes.dart';
import 'package:flut_food/user/bloc/bloc.dart';
import 'package:flut_food/user/repository/repository.dart';

import 'package:flut_food/user/screens/login.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FlutFood extends StatelessWidget {
  final ItemRepository itemRepository;
  final UserRepository userRepository;

  FlutFood({@required this.itemRepository, @required this.userRepository})
      : assert(itemRepository != null),
        assert(userRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.itemRepository,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ItemBloc(itemRepository: this.itemRepository)
                ..add(ItemLoad()),
            ),
            BlocProvider(create: (context) => CartBloc()),
            BlocProvider(create: (context) => UserBloc(this.userRepository)),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: LOGIN,
            onGenerateRoute: OnGenerateRouter.onGenerateRouter,
          )),
    );
  }
}
