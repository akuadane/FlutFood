import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Categories extends Equatable {
  Categories({this.id, this.name, this.description});

  final int id;
  final String name;
  final String description;

  @override
  List<Object> get props => [id, name, description];

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
