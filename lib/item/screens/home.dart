import 'package:flut_food/item/bloc/bloc.dart';
import 'package:flut_food/routes.dart';
import 'package:flutter/material.dart';
import 'package:flut_food/widgets/logo_widget.dart';
import 'package:flut_food/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flut_food/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //onWillPop: () => SystemNavigator.pop(),
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          backgroundColor: kLoginMainColor,
          centerTitle: true,
          elevation: 0,
          leading: Container(),
          title: Text(
            "FlutFood",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, PROFILE);
                })
          ],
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Container(
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
                  return GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: items.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ITEM_DETAIL,
                                arguments: items[index]);
                          },
                          child: Card(
                            color: Colors.white70,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/burger.svg",
                                    height: 90,
                                    width: 50,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${items[index].name}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '${items[index].description}',
                                      ),
                                      Text(
                                        '\$ ${items[index].price}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
                return CircularProgressIndicator();
              }),
            ),
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

// Column(
// mainAxisSize: MainAxisSize.min,
// children: [
// Flexible(
// fit: FlexFit.loose,
// child: ListView(
// shrinkWrap: true,
// children: [
// MenuTitle(),
// MenuTitle(),
// MenuTitle(),
// MenuTitle(),
// MenuTitle(),
// MenuTitle(),
// ],
// scrollDirection: Axis.horizontal,
// ),
// ),
// Flexible(
// fit: FlexFit.loose,
// child: ListView.builder(
// itemCount: items.length,
// itemBuilder: (_, index) {
// print(items[index].name);
// return Card(
// child: Row(
// children: [
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// '${items[index].name}',
// style: TextStyle(
// fontWeight: FontWeight.bold),
// ),
// Text(
// '${items[index].description}',
// ),
// Text('${items[index].price}'),
// ],
// ),
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.end,
// children: [
// Image.asset(
// 'assets/images/burger.svg',
// width: 60,
// height: 60,
// ),
// Row(
// children: [
// Icon(Icons.favorite_border),
// Icon(Icons.shopping_cart)
// ],
// )
// ],
// ),
// ],
// ),
// );
// }),
// ),
// ],
// )
