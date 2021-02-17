import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:flut_food/order/bloc/bloc.dart';
import 'package:flut_food/order/data_provider/order_provider.dart';
import 'package:flut_food/order/models/order.dart';
import 'package:flut_food/order/screens/order_add_screen.dart';

import 'order_detail_screen.dart';

class OrderListScreen extends StatelessWidget {
  static String routeName = "/orderListScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order List "),
        centerTitle: true,
      ),
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, orderState) {
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
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text("Order ${orders[index].id}"),
                        subtitle: Text("Item ${orders[index].itemId}"),
                        trailing: Text("${orders[index].orderState}"),
                        onTap: () {
                          Navigator.pushNamed(
                              context, OrderDetailScreen.routeName,
                              arguments: orders[index]);
                        },
                      ),
                    );
                  });
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, OrderAddScreen.routeName);
        },
      ),
    );
  }
}
