import 'dart:async';

import 'package:flut_food/user/data_provider/user_provider.dart';
import 'package:flut_food/user/model/models.dart';

class UserRepository {
  final UserProvider userProvider;

  UserRepository(this.userProvider) : assert(userProvider != null);

  Future<User> getUserByUserName(String username) async {
    return await this.userProvider.getUserByUserName(username);
  }

  Future<User> getUserById() async {
    return await this.userProvider.getUserById();
  }

  Future<User> signInUser(String username, String password) async {
    return await this.userProvider.signInUser(username, password);
  }

  Future<User> createUser(User user) async {
    return await this.userProvider.createUser(user);
  }

  Future<void> updateUser(User user) async {
    return await this.userProvider.updateUser(user);
  }

  Future<void> deleteUser(int id) async {
    return await this.userProvider.deleteUser(id);
  }
}
