import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:flut_food/item/models/models.dart';

class ItemDataProvider {
  final _baseUrl = 'http://192.168.43.7:5000';
  final http.Client httpClient;

  ItemDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Item>> getItems() async {
    final response = await httpClient.get('$_baseUrl/v1/admin/items');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final items = jsonDecode(response.body) as List;
      //print(items);
      print(items.map((item) => Item.fromJson(item)).toList());
      return items.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
