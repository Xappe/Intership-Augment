import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p8/models/item.dart';
import 'package:p8/pages/developer_page.dart';
import 'package:p8/pages/edit_page.dart';
import 'package:p8/pages/item_page.dart';

class ItemController extends GetxController {
  RxList<Item> items = <Item>[
    Item(
        picture: Icons.add,
        name: "PRODUCT A",
        category: "Clothes",
        price: 100.0,
        inventory: 5),
    Item(
        picture: Icons.baby_changing_station,
        name: "PRODUCT B",
        category: "Appliance",
        price: 10,
        inventory: 5),
    Item(
        picture: Icons.cabin,
        name: "PRODUCT C",
        category: "Food",
        price: 10,
        inventory: 5),
    Item(
        picture: Icons.dangerous,
        name: "PRODUCT D",
        category: "Accessory",
        price: 10,
        inventory: 5),
    Item(
        picture: Icons.e_mobiledata,
        name: "PRODUCT E",
        category: "Clothes",
        price: 10,
        inventory: 5),
    Item(
        picture: Icons.face,
        name: "PRODUCT F",
        category: "Accessory",
        price: 10,
        inventory: 5),
    Item(
        picture: Icons.g_mobiledata,
        name: "PRODUCT G",
        category: "Food",
        price: 10,
        inventory: 5)
  ].obs;

  void goItemPage(BuildContext context, int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ItemPage(index: index)));
  }

  void goDeveloperPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DeveloperPage()));
  }

  void goEditPage(BuildContext context, int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EditPage(index: index)));
  }
}
