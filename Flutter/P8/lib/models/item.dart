import 'package:flutter/material.dart';

class Item {
  IconData picture;
  dynamic name;
  double price;
  int inventory;
  String category;

  Item(
      {required this.picture,
      required this.name,
      required this.price,
      required this.inventory,
      required this.category});
}
