import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p8/controllers/cart_controller.dart';
import 'package:p8/controllers/item_controller.dart';

class DeveloperPage extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xffF30000),
          title: const Padding(
            padding: EdgeInsets.only(left: 80.0),
            child: Text(
              'STORE',
              style: TextStyle(fontSize: 35.0),
            ),
          ),
        ),
        body: Container(
            color: Colors.orange,
            child: GetX<ItemController>(builder: (controller) {
              return Container(
                height: 600.0,
                width: 412.0,
                child: ListView.builder(
                    itemCount: itemController.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(children: <Widget>[
                            Container(
                              color: Colors.blue,
                              width: 140.0,
                              height: 50,
                              child: Text(
                                itemController.items[index].name,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Icon(
                                itemController.items[index].picture,
                                size: 25.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                color: Colors.blue,
                                width: 60.0,
                                child: Text(
                                  "R\$" +
                                      itemController.items[index].price
                                          .toString() +
                                      "0",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                color: Colors.blue,
                                width: 70,
                                child: Text(
                                  itemController.items[index].category,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Container(
                                color: Colors.blue,
                                width: 25,
                                child: Text(
                                  itemController.items[index].inventory
                                      .toString(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  itemController.goEditPage(context, index);
                                },
                              ),
                            ),
                          ]),
                        ),
                      );
                    }),
              );
            })));
  }
}
