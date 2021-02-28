import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flut_food/order/bloc/bloc.dart';
import 'package:flut_food/order/models/order.dart';
import 'package:flut_food/order/screens/screens.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';

class OrderUpdateScreen extends StatefulWidget {
  static String routeName = "/orderUpdateScreen";
  Order order;

  OrderUpdateScreen(this.order) : assert(order != null);

  @override
  _OrderUpdateScreenState createState() => _OrderUpdateScreenState();
}

class _OrderUpdateScreenState extends State<OrderUpdateScreen> {
  final _order = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update order"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                Text(
                  "",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SvgPicture.asset(
                  "assets/images/burger.svg",
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kLoginMainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          if (widget.order.quantity > 1) {
                            setState(() {
                              widget.order.id--;
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "${widget.order.id}",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: kLoginMainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.order.id++;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Product Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ), // This is to align the text to the left
                Text(
                  "",
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: backgroundColor,
        child: Container(
          decoration: BoxDecoration(
            color: kLoginMainColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 10,
                          color: kSignupTextColor,
                        ),
                      ),
                      Text(
                        "",
                        // "\$ ${_price * _amount}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //UserState userState = context.read<UserBloc>().state;

                    //int userId = userState.user.id;
                    BlocProvider.of<OrderBloc>(context).add(
                      OrderUpdate(
                        Order(
                          id: widget.order.id,
                          itemId: this._order["item_id"],
                          orderState: widget.order.orderState,
                          userId: this._order["user_id"],
                          quantity: this._order["quantity"],
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// RaisedButton(
//                   onPressed: () {
//                     final form = this._formKey.currentState;
//                     if (form.validate()) {
//                       form.save();
//                       BlocProvider.of<OrderBloc>(context).add(
//                         OrderUpdate(
//                           Order(
//                             id: widget.order.id,
//                             itemId: this._order["item_id"],
//                             orderState: widget.order.orderState,
//                             userId: this._order["user_id"],
//                             quantity: this._order["quantity"],
//                           ),
//                         ),
//                       );
//                       Navigator.pushNamed(context, OrderListScreen.routeName);
//                     }
//                   },
//                   child: Text("Update order"),
//                 ),
