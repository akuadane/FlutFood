import 'package:flut_food/order/models/models.dart';

class Cart {
  static List<Order> _cart = [];

  static void addOrder(Order order) {
    _cart.add(order);
  }

  static void deleteOrder(int i) {
    _cart.removeAt(i);
  }

  static void deleteAllOrders() {
    _cart = [];
  }

  static List<Order> get cart => _cart;
}
