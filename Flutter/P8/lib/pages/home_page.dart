import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p8/controllers/cart_controller.dart';
import 'package:p8/controllers/filter_controller.dart';
import 'package:p8/controllers/item_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ItemController itemController = Get.put(ItemController());
    final CartController cartController = Get.put(CartController());
    final FilterController filterController = Get.put(FilterController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xffF30000),
          leading: IconButton(
            icon: const Icon(Icons.engineering),
            onPressed: () {
              itemController.goDeveloperPage(context);
            },
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 80.0),
            child: Text(
              'STORE',
              style: TextStyle(fontSize: 35.0),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  cartController.goCartPage(context);
                },
              ),
            )
          ],
        ),
        body: Column(children: <Widget>[
          Container(
            width: 412.0,
            height: 50.0,
            color: Color(0xffF30000),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            width: 412.0,
                            color: Color(0xffFFFFFF),
                            child: Obx(() {
                              return Column(children: <Widget>[
                                Container(
                                  width: 412.0,
                                  height: 50.0,
                                  color: Color(0xffF30000),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 40.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        filterController.applyFilter(context);
                                      },
                                      child: Container(
                                        color: Color(0xffF30000),
                                        child: Row(children: <Widget>[
                                          Text("Aply Filter",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Color(0xffFFFFFF))),
                                          Icon(Icons.play_arrow,
                                              size: 30.0,
                                              color: Color(0xffFFFFFF)),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50.0,
                                  width: 200.0,
                                  child: TextFormField(
                                    controller: filterController.priceFilter,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: "Max Price",
                                      floatingLabelStyle:
                                          TextStyle(fontSize: 0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 200.0,
                                  width: 412.0,
                                  child: ListView.builder(
                                      itemCount:
                                          filterController.parameters.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Container(
                                            color: Color(0xffFFFFFF),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                      value: filterController
                                                          .parameters[index]
                                                          .isChecked,
                                                      onChanged: (bool? value) {
                                                        filterController
                                                            .checkBox(
                                                                index, value);
                                                      }),
                                                  Text(
                                                    filterController
                                                        .parameters[index].name,
                                                    style: TextStyle(
                                                        fontSize: 20.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    filterController.cleanFilter();
                                  },
                                  child: Container(
                                    height: 64.0,
                                    color: Color(0xffF30000),
                                    child: Row(children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 130.0),
                                        child: Text("Clean FIlter",
                                            style: TextStyle(
                                                fontSize: 25.0,
                                                color: Color(0xffFFFFFF))),
                                      ),
                                      Icon(Icons.delete,
                                          size: 30.0, color: Color(0xffFFFFFF)),
                                    ]),
                                  ),
                                ),
                              ]);
                            }));
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      color: Color(0xffF30000),
                      child: Row(children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 15.0),
                          child: Text(
                            "FILTER",
                            style: TextStyle(
                                color: Color(0xffFFFFFF), fontSize: 25.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.filter_alt,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    child: Obx(() {
                      return Text(
                        "R\$" +
                            cartController.totalprice.value.toString() +
                            "0",
                        style:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 25.0),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Container(
              height: 500.0,
              child: GetX<ItemController>(builder: (controller) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    itemCount: filterController.mainList(),
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            itemController.goItemPage(context, index);
                          },
                          child: AnimatedContainer(
                              duration: Duration(seconds: 0),
                              decoration:
                                  BoxDecoration(color: Color(0xffE9E9E9)),
                              child: Container(
                                  child: Column(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Text(
                                    filterController.filter[index].name,
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                ),
                                Container(
                                  color: Color(0xffE9E9E9),
                                  child: Icon(
                                    filterController.filter[index].picture,
                                    size: 100.0,
                                    color: Color(0xff404040),
                                  ),
                                ),
                                Row(children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      color: Color(0xffE9E9E9),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.shopping_cart,
                                          size: 32.0,
                                        ),
                                        onPressed: () {
                                          cartController.addProduct(
                                              false,
                                              context,
                                              index,
                                              filterController
                                                  .filter[index].inventory,
                                              1);
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 35.0),
                                    child: Container(
                                      color: Color(0xffE9E9E9),
                                      child: Text(
                                        "R\$" +
                                            filterController.filter[index].price
                                                .toString() +
                                            "0",
                                        style: TextStyle(fontSize: 25.0),
                                      ),
                                    ),
                                  ),
                                ])
                              ]))),
                        ),
                      );
                    });
              }),
            ),
          )
        ]));
  }
}
