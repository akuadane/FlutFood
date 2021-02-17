import 'dart:convert';

import 'package:flut_food/api_config_files.dart';
import 'package:flut_food/user/model/models.dart';
import 'package:http/http.dart';

class UserProvider {
  final Client httpClient;

  UserProvider(this.httpClient) : assert(httpClient != null);

  Future<User> getUserByUserName(String username) async {
    final response =
        await this.httpClient.get("$baseURL/v1/admin/username/$username");

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception("Error fetching user");
  }

  Future<User> createUser(User user) async {
    final response = await httpClient.post(
      "$baseURL/v1/admin/users",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "username": user.userName,
        "email": user.email,
        "fullname": user.fullName,
        "phone": user.phone,
        "password": user.password
      }),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception("Error creating user");
  }

  Future<void> updateUser(User user) async {
    final response = await this.httpClient.put(
          "$baseURL/v1/admin/users/${user.id}",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "username": user.userName,
            "email": user.email,
            "fullname": user.fullName,
            "phone": user.phone,
            "password": user.password
          }),
        );

    if (response.statusCode != 200) throw Exception("Error updating user data");
  }

  Future<void> deleteUser(int id) async {
    final response =
        await this.httpClient.delete("$baseURL/v1/admin/users/$id");

    if (response.statusCode != 204) {
      throw Exception("Error deleting user");
    }
  }
}
