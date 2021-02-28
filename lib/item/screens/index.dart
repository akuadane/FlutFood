import 'package:flut_food/cart/screens/list_cart.dart';
import 'package:flut_food/colors.dart';
import 'package:flut_food/item/screens/home.dart';
import 'package:flutter/material.dart';

class HomeHolder extends StatefulWidget {
  @override
  _HomeHolderState createState() => _HomeHolderState();
}

class _HomeHolderState extends State<HomeHolder> {
  int _currentPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: [
          HomePage(),
          Container(),
          CartList(),
        ],
        onPageChanged: (currentPage) {
          setState(() {
            this._currentPage = currentPage;
          });
        },
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kLoginMainColor,
        onTap: (index) {
          this._pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: 20,
              color: Colors.white,
            ),
            title: Text(
              "Orders",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 20,
              color: Colors.white,
            ),
            title: Text(
              "Cart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
