import 'package:flut_food/cart/bloc/cart_event.dart';
import 'package:flut_food/cart/bloc/cart_state.dart';
import 'package:flut_food/order/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, List<Order>> {
  CartBloc() : super(List<Order>());

  @override
  Stream<List<Order>> mapEventToState(CartEvent event) async* {
    if (event is AddOrder) {
      Cart.addOrder(event.order);
      yield Cart.cart;
    }
    if (event is DeleteOrder) {
      Cart.deleteOrder(event.index);
      yield Cart.cart;
    }
    if (event is DeleteAllOrders) {
      Cart.deleteAllOrders();
      yield Cart.cart;
    }
  }
}
