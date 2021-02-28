import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:flut_food/item/models/models.dart';
import 'package:flut_food/api_config_files.dart';

class ItemDataProvider {
  //final _baseUrl = 'http://192.168.43.7:5000';
  final http.Client httpClient;

  ItemDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Item>> getItems() async {
    final response = await httpClient
        .get('$baseURL/v1/admin/items', headers: <String, String>{
      'api-key': "9fe8c794-32fd-4dba-b57e-68194327285d",
    });

    if (response.statusCode == 200) {
      final items = jsonDecode(response.body) as List;
      final temp = items.map((item) => Item.fromJson(item)).toList();
      
      return temp;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<Item> getItem(int id) async {
    final response = await httpClient.get(
      '$baseURL/v1/admin/items/$id',
      headers: <String, String>{
        'api-key': "9fe8c794-32fd-4dba-b57e-68194327285d",
      },
    );
    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get item');
    }
  }
}
