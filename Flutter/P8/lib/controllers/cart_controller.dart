import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p8/controllers/filter_controller.dart';
import 'package:p8/models/boxes.dart';
import 'package:p8/models/cart.dart';
import 'package:p8/models/item.dart';
import 'package:p8/pages/cart_page.dart';
import 'package:p8/pages/home_page.dart';
import 'item_controller.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartController extends GetxController {
  final ItemController itemController = Get.put(ItemController());
  final FilterController filterController = Get.put(FilterController());

  TextEditingController newName = TextEditingController();
  TextEditingController newPrice = TextEditingController();
  TextEditingController newCategory = TextEditingController();
  TextEditingController newInventory = TextEditingController();

  RxList<Cart> cart = <Cart>[].obs;

  RxDouble totalprice = 0.0.obs;

  RxInt nProduct = 1.obs;

  void goCartPage(BuildContext context) {
    nProduct = 1.obs;
    final Box<Cart> box = Boxes.getCart();
    cart.value = box.values.toList();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CartPage()));
  }

  Future<void> addProduct(bool check, BuildContext context, int index,
      int amoutProduct, int n) async {
    int k = 0;

    for (int i = 0; i < cart.length; i++) {
      if (filterController.filter[index].name == cart[i].item.name) {
        if (cart[i].amount + n > cart[i].item.inventory) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text("Insufficient stock"),
                    content: const Text("Buy a smaller amount of items"),
                    actions: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Ok")),
                    ],
                  ));
        } else {
          cart[i].amount = cart[i].amount + n;
        }

        k++;
      }
    }

    if (k == 0) {
      Box<Cart> cartBox = Hive.box("boxCart");

      cartBox.add(Cart(item: filterController.filter[index], amount: n));
      print("ok");
      /* final Cart newItemCart = Cart()
        ..item = filterController.filter[index]
        ..amount = n;

      final Box<Cart> box = Boxes.getCart();
      box.add(newItemCart);

      cart.value = box.values.toList();

      print(cart[0].item.name.toString()); */
    }

    if (check == true) {
      Navigator.pop(context);
    }
    cart.refresh();
    calculatingTotalPrice();
  }

  bool emptyCart() {
    if (cart.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void removeItem(int index) {
    cart.remove(cart[index]);
    calculatingTotalPrice();
    cart.refresh();
  }

  void cleanCart(BuildContext context) {
    totalprice.value = 0.0;
    totalprice.refresh();
    cart.clear();
    cart.refresh();
    Navigator.pop(context);
  }

  void editItem(int index, BuildContext context) {
    if (newName.text != null && newName.text != "") {
      itemController.items[index].name = newName.text;
    }
    if (newPrice.text != null && newPrice.text != "") {
      itemController.items[index].price = double.parse(newPrice.text);
    }
    if (newCategory.text != null && newCategory.text != "") {
      itemController.items[index].category = newCategory.text;
    }
    if (newInventory.text != null && newInventory.text != "") {
      itemController.items[index].inventory = int.parse(newInventory.text);
    }
    newName.text = "";
    newPrice.text = "";
    newCategory.text = "";
    newInventory.text = "";

    itemController.items.refresh();
    cart.clear();

    final Box<Cart> box = Boxes.getCart();
    box.clear();

    calculatingTotalPrice();
    cart.refresh();

    Navigator.pop(context);
  }

  void numberItem(int s, BuildContext context) {
    if (nProduct == 1 && s < 0) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Minimum number of items reached"),
                content:
                    const Text("Add some product or complete the purchase"),
                actions: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok")),
                ],
              ));
    } else {
      nProduct.value = nProduct.value + s;
      nProduct.refresh();
    }
  }

  void calculatingTotalPrice() {
    totalprice.value = 0.0;

    for (int i = 0; i < cart.length; i++) {
      totalprice.value =
          (totalprice.value + (cart[i].item.price * cart[i].amount));
    }
    totalprice.refresh();
  }
}
