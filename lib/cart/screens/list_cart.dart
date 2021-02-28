import 'package:flut_food/cart/bloc/bloc.dart';
import 'package:flut_food/colors.dart';
import 'package:flut_food/order/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "CART",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kLoginMainColor,
          ),
        ),
        leading: Container(),
      ),
      body: BlocBuilder<CartBloc, List<Order>>(
        builder: (context, orders) {
          return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Card(
                  child:
                      Text("${orders[index].itemId} ${orders[index].quantity}"),
                );
              });
        },
      ),
    );
  }
}
