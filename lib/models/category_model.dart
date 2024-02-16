import 'package:commerce_app/utils/color.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Coffee',
        iconPath: "assets/images/coffee-icon.svg",
        boxColor: colorBrown));
    categories.add(CategoryModel(
        name: 'Pie',
        iconPath: "assets/images/coffee-icon.svg",
        boxColor: colorPink));
    categories.add(CategoryModel(
        name: 'Pizza',
        iconPath: "assets/images/coffee-icon.svg",
        boxColor: colorOrange));
    categories.add(CategoryModel(
        name: 'Burger',
        iconPath: "assets/images/coffee-icon.svg",
        boxColor: colorPink));
    categories.add(CategoryModel(
        name: 'Cake',
        iconPath: "assets/images/coffee-icon.svg",
        boxColor: colorPurple));
    categories.add(CategoryModel(
        name: 'Milk',
        iconPath: "assets/images/coffee-icon.svg",
        boxColor: colorOrange));

    return categories;
  }
}

