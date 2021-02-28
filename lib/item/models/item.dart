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
  final List<Categories> categories;
  final List<Ingredients> ingredients;

  List<Object> get props =>
      [id, name, price, description, categories, ingredients];

  factory Item.fromJson(Map<String, dynamic> json) {
    //TODO make the catagories and ingredients lists so that they match the data from the API
    List<Categories> tempCategories = [];
    List<Ingredients> tempIngredients = [];

    for (int i = 0; i < json["categories"].length; i++) {
      tempCategories.add(Categories.fromJson(json["categories"][i]));
    }

    for (int i = 0; i < json["ingredients"].length; i++) {
      tempIngredients.add(Ingredients.fromJson(json["ingredients"][i]));
    }

    return Item(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      categories: tempCategories,
      ingredients: tempIngredients,
    );
  }
}
