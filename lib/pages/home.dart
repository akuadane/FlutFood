import 'package:flut_food/item/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flut_food/widgets/logo_widget.dart';
import 'package:flut_food/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              flutFoodLogo,
              Card(
                child: ListTile(
                  leading: Icon(Icons.map),
                  title: Text(
                    '4,King George VI Street,Addis ;)Ababa',
                    style: TextStyle(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: kSecondaryColor),
                  color: Colors.white,
                ),
                child: BlocBuilder<ItemBloc, ItemState>(builder: (_, state) {
                  if (state is ItemOperationFailure) {
                    return Text("could not do item operation");
                  }
                  if (state is ItemsLoadSuccess) {
                    final items = state.items;
                    return Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              MenuTitle(),
                              MenuTitle(),
                              MenuTitle(),
                              MenuTitle(),
                              MenuTitle(),
                              MenuTitle(),
                            ],
                          ),
                        ),
                        ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (_, index) => Card(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${items[index].name}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${items[index].description}',
                                    ),
                                    Text('${items[index].price}'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      'assets/images/burger.svg',
                                      width: 60,
                                      height: 60,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.favorite_border),
                                        Icon(Icons.shopping_cart)
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuTitle extends StatelessWidget {
  final String title;
  final bool active;
  const MenuTitle({
    this.title,
    this.active = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Text(
        'Snacks',
        style: TextStyle(color: active ? kSecondaryColor : Colors.white),
      ),
    );
  }
}
