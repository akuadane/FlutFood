import 'package:meta/meta.dart';
import 'package:flut_food/item/item.dart';

class ItemRepository {
  final ItemDataProvider dataProvider;

  ItemRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<List<Item>> getItems() async {
    return await dataProvider.getItems();
  }

  Future<Item> getItem(int id) async {
    return await dataProvider.getItem(id);
  }
}
