import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
@immutable
class Ingredients extends Equatable {
  Ingredients({this.id, this.name, this.description});

  final int id;
  final String name;
  final String description;

  @override
  List<Object> get props => [id, name, description];

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
