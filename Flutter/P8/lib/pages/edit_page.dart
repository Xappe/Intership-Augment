import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p8/controllers/cart_controller.dart';
import 'package:p8/controllers/filter_controller.dart';
import 'package:p8/controllers/item_controller.dart';

class EditPage extends StatelessWidget {
  final int index;
  EditPage({Key? key, required this.index}) : super(key: key);

  final CartController cartController = Get.put(CartController());
  final ItemController itemController = Get.put(ItemController());
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xffF30000),
          title: Padding(
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
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, right: 25.0),
                      child: Container(
                        width: 180.0,
                        color: Colors.blue,
                        child: Icon(
                          itemController.items[index].picture,
                          size: 180.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Container(
                            color: Colors.blue,
                            width: 180.0,
                            child: Center(
                              child: Text(
                                itemController.items[index].name,
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 180.0,
                          height: 35.0,
                          color: Color(0xffFFFFFF),
                          child: TextFormField(
                            controller: cartController.newName,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "New Product Name",
                              floatingLabelStyle: TextStyle(fontSize: 0),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Container(
                            width: 180.0,
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                "R\$" +
                                    itemController.items[index].price
                                        .toString() +
                                    "0",
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 180.0,
                          height: 35.0,
                          color: Color(0xffFFFFFF),
                          child: TextFormField(
                            controller: cartController.newPrice,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "New Product Price",
                              floatingLabelStyle: TextStyle(fontSize: 0),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Container(
                            color: Colors.blue,
                            width: 180.0,
                            child: Center(
                              child: Text(
                                itemController.items[index].category,
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 180.0,
                          height: 35.0,
                          color: Color(0xffFFFFFF),
                          child: TextFormField(
                            controller: cartController.newCategory,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "New Product Category",
                              floatingLabelStyle: TextStyle(fontSize: 0),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Container(
                            color: Colors.blue,
                            width: 180.0,
                            child: Center(
                              child: Text(
                                itemController.items[index].inventory
                                    .toString(),
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 180.0,
                          height: 35.0,
                          color: Color(0xffFFFFFF),
                          child: TextFormField(
                            controller: cartController.newInventory,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "New Product Inventory",
                              floatingLabelStyle: TextStyle(fontSize: 0),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: GestureDetector(
                          onTap: () {
                            cartController.editItem(index, context);
                          },
                          child: Container(
                              height: 50, width: 100, child: Text("OK"))),
                    )
                  ]),
                ),
              );
            })));
  }
}
