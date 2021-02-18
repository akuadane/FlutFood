import 'package:equatable/equatable.dart';
import 'package:flut_food/item/item.dart';

class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemLoading extends ItemState {}

class ItemsLoadSuccess extends ItemState {
  final List<Item> items;

  ItemsLoadSuccess([this.items = const []]);

  @override
  List<Object> get props => [items];
}

class ItemOperationFailure extends ItemState {}
