import 'package:flut_food/cart/bloc/bloc.dart';
import 'package:flut_food/colors.dart';
import 'package:flut_food/item/data_provider/data_provider.dart';
import 'package:flut_food/item/models/models.dart';
import 'package:flut_food/item/repository/repository.dart';
import 'package:flut_food/order/bloc/bloc.dart';
import 'package:flut_food/order/models/models.dart';
import 'package:flut_food/routes.dart';
import 'package:flut_food/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class CartList extends StatelessWidget {
  final ItemRepository itemRepository =
      ItemRepository(dataProvider: ItemDataProvider(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, List<Order>>(
      builder: (context, orders) => Scaffold(
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
        body: Builder(
          builder: (context) {
            if (orders.isNotEmpty)
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      Order order = orders[index];

                      return FutureBuilder<Item>(
                          future: itemRepository.getItem(orders[index].itemId),
                          builder: (context, tempItem) {
                            if (tempItem.hasData) {
                              Item item = tempItem.data;
                              return Dismissible(
                                key: Key(order.toString()),
                                child: Card(
                                  child: ListTile(
                                    isThreeLine: true,
                                    leading: (item.image == "")
                                        ? SvgPicture.asset(
                                            "assets/images/burger.svg",
                                            width: 90,
                                          )
                                        : Image.network(
                                            item.image,
                                            fit: BoxFit.cover,
                                            width: 90,
                                          ),
                                    title: Text(
                                      "${item.name}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                        "Quantity: ${orders[index].quantity}\nTotal Price: \$${order.quantity * item.price}\nStatus: ${order.orderState}"),
                                  ),
                                ),
                                onDismissed: (direction) {
                                  BlocProvider.of<CartBloc>(context)
                                      .add(DeleteOrder(index));
                                },
                              );
                            }

                            return Container();
                          });
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
              onPressed: () {
                for (int i = 0; i < orders.length; i++) {
                  BlocProvider.of<OrderBloc>(context)
                      .add(OrderCreate(orders[i]));
                }
                BlocProvider.of<CartBloc>(context).add(DeleteAllOrders());
                Navigator.pushNamed(context, HOME_HOLDER);
              },
              color: Colors.white,
              labelColor: kLoginMainColor,
            ),
          ),
        ),
      ),
    );
  }
}
