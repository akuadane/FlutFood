import 'package:flut_food/cart/bloc/bloc.dart';
import 'package:flut_food/item/models/models.dart';
import 'package:flut_food/order/models/models.dart';
import 'package:flut_food/user/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flut_food/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ItemDetail extends StatefulWidget {
  final Item item;

  ItemDetail({this.item});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int _amount = 1;
  int _price = 0;
  String _name = "";
  String _description = "";

  @override
  void initState() {
    this._price = widget.item.price;
    this._description = widget.item.description;
    this._name = widget.item.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/backarrow.png"),
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
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
                  _name,
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
                        "$_amount",
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
                  _description,
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
                        "\$ ${_price * _amount}",
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
                    UserState userState = context.read<UserBloc>().state;

                    if (userState is UserSuccessfullySignedIn) {
                      int userId = userState.user.id;
                      BlocProvider.of<CartBloc>(context).add(AddOrder(
                        Order(
                          itemId: widget.item.id,
                          quantity: _amount,
                          orderState: "Pending",
                          userId: userId,
                        ),
                      ));
                      Navigator.pop(context);
                    }
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
                          "Add to Cart",
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
