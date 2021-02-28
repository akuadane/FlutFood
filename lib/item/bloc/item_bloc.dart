import 'package:flut_food/item/bloc/bloc.dart';
import 'package:flut_food/item/item.dart';
import 'package:flutter/cupertino.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc({@required this.itemRepository})
      : assert(itemRepository != null),
        super(ItemLoading());

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is ItemLoad) {
      yield ItemLoading();
      try {
        final items = await itemRepository.getItems();
        yield ItemsLoadSuccess(items);
      } catch (_) {
        yield ItemOperationFailure();
      }
    }
  }
}
