import 'package:flut_food/cart/bloc/cart_state.dart';
import 'package:flut_food/order/models/models.dart';

abstract class CartEvent {
  CartEvent();
}

class AddOrder extends CartEvent {
  Order order;

  AddOrder(this.order);
}

class DeleteOrder extends CartEvent {
  int index;

  DeleteOrder(this.index);
}

class DeleteAllOrders extends CartEvent {}
