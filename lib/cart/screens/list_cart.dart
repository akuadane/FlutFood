import 'package:flut_food/cart/bloc/bloc.dart';
import 'package:flut_food/colors.dart';
import 'package:flut_food/item/models/models.dart';
import 'package:flut_food/order/models/models.dart';
import 'package:flut_food/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          if (orders.isNotEmpty)
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    Order order = orders[index];
                    Item item = Item(
                      id: 1,
                      name: "FirFir",
                      price: 20,
                    );

                    return Dismissible(
                      key: Key(order.toString()),
                      child: Card(
                        child: ListTile(
                          isThreeLine: true,
                          leading: SvgPicture.asset(
                            "assets/images/burger.svg",
                            height: 90,
                            width: 50,
                          ),
                          title: Text(
                            "${item.name}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                              "Quantity: ${orders[index].quantity}\nTotal Price: \$ ${order.quantity * item.price}\nStatus: ${order.orderState}"),
                        ),
                      ),
                      onDismissed: (direction) {
                        BlocProvider.of<CartBloc>(context)
                            .add(DeleteOrder(index));
                      },
                    );
                  }),
            );

          return Container(
            child: Center(
              child: Text("No orders in cart."),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: RoundedButton(
            text: 'Place Order',
            onPressed: () {},
            color: Colors.white,
            labelColor: kLoginMainColor,
          ),
        ),
      ),
    );
  }
}
