import 'package:flutter/cupertino.dart';

class User {
  int id;
  String userName, fullName, email, phone, password;

  User({
    @required this.id,
    @required this.userName,
    @required this.fullName,
    @required this.phone,
    @required this.email,
    @required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        userName: json["username"],
        fullName: json["fullname"],
        phone: json["phone"],
        password: json["password"],
        email: json["email"]);
  }

  @override
  String toString() {
    return "User: {id: $id, username:$userName, fullname: $fullName, phone: $phone, email: $email}";
  }
}
