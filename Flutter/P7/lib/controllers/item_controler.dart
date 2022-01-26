import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p7/models/item.dart';
import 'package:p7/pages/second_route.dart';
import 'package:p7/pages/third_route.dart';

class ItemController extends GetxController {
  var items = <Item>[].obs;
  TextEditingController namecontroller = TextEditingController();

  TextEditingController positioncontroller = TextEditingController();

  void checkbox(int index) {
    if (items[index].route == 0) {
      items[index].colorcontainer = Colors.blue;
      items[index].route = 1;
      items[index].sizebutton = 0;
    }
    items.refresh();
  }

  void additem(String s) {
    items.add(Item(
        name: s, colorcontainer: Colors.orange, sizebutton: 29.0, route: 0));
    namecontroller.text = "";
  }

  void change(int index, BuildContext context) {
    if (namecontroller.text != "") {
      items[index].name = namecontroller.text;
    }
    if (positioncontroller.text != "") {
      if (index + 1 != int.parse(positioncontroller.text)) {
        {
          items.insert(
              int.parse(positioncontroller.text) -
                  1 +
                  (int.parse(positioncontroller.text) - 1 < index ? 0 : 1),
              Item(
                  name: items[index].name,
                  colorcontainer: items[index].colorcontainer,
                  sizebutton: items[index].sizebutton,
                  route: items[index].route));

          int.parse(positioncontroller.text) - 1 < index
              ? items.removeAt(index + 1)
              : items.removeAt(index);
        }
      }
    }

    positioncontroller.text = "";
    namecontroller.text = "";
    items.refresh();
    Navigator.pop(context);
  }

  void gopage(int index, BuildContext context) {
    items[index].route == 0
        ? Navigator.push(context,
            MaterialPageRoute(builder: (context) => SecondRoute(index: index)))
        : Navigator.push(context,
            MaterialPageRoute(builder: (context) => ThirdRoute(index: index)));
  }

  void delet(int index, BuildContext context) {
    items.removeAt(index);
    positioncontroller.text = "";
    namecontroller.text = "";
    Navigator.pop(context);
  }
}
