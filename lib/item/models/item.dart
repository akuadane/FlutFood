import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'models.dart';

@immutable
class Item extends Equatable {
  Item(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.categories,
      this.ingredients});

  final int id;
  final String name;
  final int price;
  final String description;
  final Categories categories;
  final Ingredients ingredients;

  List<Object> get props =>
      [id, name, price, description, categories, ingredients];

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      categories: json['categories'],
      ingredients: json['ingredients'],
    );
  }
}
