import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p8/controllers/item_controller.dart';
import 'package:p8/models/item.dart';
import 'package:p8/models/parameter.dart';

class FilterController extends GetxController {
  final ItemController itemController = Get.put(ItemController());
  TextEditingController priceFilter = TextEditingController();

  RxList<Item> filter = <Item>[].obs;
  RxList<Parameter> parameters = <Parameter>[
    Parameter(name: "Clothes", isChecked: false),
    Parameter(name: "Appliance", isChecked: false),
    Parameter(name: "Food", isChecked: false),
    Parameter(name: "Accessory", isChecked: false),
    Parameter(name: "Smartphone", isChecked: false),
  ].obs;

  int mainList() {
    if (filter.isEmpty) {
      for (int i = 0; i < itemController.items.length; i++) {
        filter.add(itemController.items[i]);
      }
    }
    return filter.length;
  }

  void checkBox(int index, bool? value) {
    parameters[index].isChecked = value!;
    parameters.refresh();
  }

  void applyFilter(BuildContext context) {
    int k = 0;
    filter.clear();

    for (int i = 0; i < parameters.length; i++) {
      if (parameters[i].isChecked != false) {
        k++;
      }
    }

    if (k == 0) {
      if (priceFilter.text != "") {
        if (itemController.items.isEmpty) {
        } else {
          for (int j = 0; j < itemController.items.length; j++) {
            if (itemController.items[j].price < int.parse(priceFilter.text)) {
              filter.add(Item(
                  picture: itemController.items[j].picture,
                  name: itemController.items[j].name,
                  price: itemController.items[j].price,
                  inventory: itemController.items[j].inventory,
                  category: itemController.items[j].category));
            }
          }
        }
      }
    } else {
      if (priceFilter.text == "") {
        for (int i = 0; i < parameters.length; i++) {
          for (int j = 0; j < itemController.items.length; j++) {
            if (parameters[i].isChecked != false &&
                itemController.items[j].category == parameters[i].name) {
              filter.add(Item(
                  picture: itemController.items[j].picture,
                  name: itemController.items[j].name,
                  price: itemController.items[j].price,
                  inventory: itemController.items[j].inventory,
                  category: itemController.items[j].category));
            }
          }
        }
      } else {
        for (int i = 0; i < parameters.length; i++) {
          for (int j = 0; j < itemController.items.length; j++) {
            if (parameters[i].isChecked != false &&
                itemController.items[j].category == parameters[i].name &&
                itemController.items[j].price <= int.parse(priceFilter.text)) {
              filter.add(Item(
                  picture: itemController.items[j].picture,
                  name: itemController.items[j].name,
                  price: itemController.items[j].price,
                  inventory: itemController.items[j].inventory,
                  category: itemController.items[j].category));
            }
          }
        }
      }
    }

    if (filter.isEmpty) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Filter did not find any product"),
                content: const Text("Insert another filter"),
                actions: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok")),
                ],
              ));

      cleanFilter();
    }
    priceFilter.text = "";
    filter.refresh();
  }

  void cleanFilter() {
    filter.clear();
    for (int i = 0; i < parameters.length; i++) {
      parameters[i].isChecked = false;
    }
    filter.refresh();
    parameters.refresh();
  }
}
