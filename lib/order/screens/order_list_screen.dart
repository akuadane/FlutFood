import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flut_food/order/bloc/bloc.dart';
import 'package:flut_food/order/models/order.dart';

import '../../colors.dart';
import '../../item/item.dart';
import '../../item/repository/item_repository.dart';
import 'package:flut_food/routes.dart';
import 'order_detail_screen.dart';

class OrderListScreen extends StatelessWidget {
  static String routeName = "/orderListScreen";
  final ItemRepository itemRepository =
      ItemRepository(dataProvider: ItemDataProvider(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrderBloc>(context).add(OrderLoad());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "ORDERS",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kLoginMainColor,
            ),
          ),
        ),
        backgroundColor: Colors.white70,
        body: SafeArea(child:
            BlocBuilder<OrderBloc, OrderState>(builder: (context, orderState) {
          if (orderState is OrderLoadingFailure)
            return Center(
              child: Text(
                "Error! Can't load orders",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );

          if (orderState is OrderLoaded) {
            List<Order> orders = orderState.orders;
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<Item>(
                    future: itemRepository.getItem(orders[index].itemId),
                    builder: (context, tempItem) {
                      if (tempItem.hasData) {
                        Item item = tempItem.data;
                        return Card(
                          child: ListTile(
                            isThreeLine: true,
                            leading: Image.asset('assets/images/pizza.jpg'),
                            title: Text("${item.name}"),
                            subtitle: Text(
                                "Quantity: ${orders[index].quantity}\nState: ${orders[index].orderState}"),
                            trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  BlocProvider.of<OrderBloc>(context)
                                      .add(OrderDelete(orders[index]));
                                  // Navigator.pushNamed(
                                  //     context, OrderListScreen.routeName);
                                }),
                            onTap: () {
                              Navigator.pushNamed(context, ORDER_DETAIL,
                                  arguments: orders[index]);
                            },
                          ),
                        );
                      }

                      return Container();
                    },
                  );
                });
          }
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        })));
  }
}
