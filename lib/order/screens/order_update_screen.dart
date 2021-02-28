import 'package:flut_food/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flut_food/order/bloc/bloc.dart';
import 'package:flut_food/order/models/order.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../colors.dart';
import '../../item/data_provider/item_data.dart';
import '../../item/item.dart';
import '../../item/repository/item_repository.dart';

class OrderUpdateScreen extends StatefulWidget {
  static String routeName = "/orderUpdateScreen";
  final Order order;
  final ItemRepository itemRepository =
      ItemRepository(dataProvider: ItemDataProvider(httpClient: http.Client()));

  OrderUpdateScreen(this.order) : assert(order != null);

  @override
  _OrderUpdateScreenState createState() => _OrderUpdateScreenState();
}

class _OrderUpdateScreenState extends State<OrderUpdateScreen> {
  int _amount;

  @override
  void initState() {
    this._amount = widget.order.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "UPDATE ORDER",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kLoginMainColor,
          ),
        ),
        leading: Container(),
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
                          if (_amount > 1) {
                            setState(() {
                              _amount--;
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "${_amount}",
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
                            _amount++;
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
        child: RoundedButton(
          text: 'Update Order',
          onPressed: () {
            BlocProvider.of<OrderBloc>(context).add(
              OrderUpdate(
                Order(
                  id: widget.order.id,
                  itemId: widget.order.itemId,
                  orderState: widget.order.orderState,
                  userId: widget.order.userId,
                  quantity: this._amount,
                ),
              ),
            );
            Navigator.pop(context);
          },
          color: accentColor,
          labelColor: Colors.white,
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
