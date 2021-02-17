import 'package:flutter/cupertino.dart';

class Order {
  int id, quantity, userId, itemId;
  String orderState;

  Order({
    this.id,
    @required this.quantity,
    @required this.itemId,
    @required this.orderState,
    @required this.userId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"],
      quantity: json["quantity"],
      itemId: json["item_id"],
      orderState: json["order_state"],
      userId: json["user_id"],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Order {id: $id, user_id: $userId, item_id: $itemId, quantity: $quantity, order_state: $orderState}";
  }
}
