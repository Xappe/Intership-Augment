import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p8/controllers/cart_controller.dart';
import 'package:p8/controllers/filter_controller.dart';

class ItemPage extends StatelessWidget {
  final int index;
  ItemPage({Key? key, required this.index}) : super(key: key);

  final CartController cartController = Get.put(CartController());
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffF30000),
        title: const Padding(
          padding: EdgeInsets.only(left: 80.0),
          child: Text(
            'STORE',
            style: TextStyle(fontSize: 35.0),
          ),
        ),
      ),
      body: Container(
        width: 412.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                color: const Color(0xffE9E9E9),
                child: Icon(
                  filterController.filter[index].picture,
                  size: 300.0,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                      width: 300.0,
                      child: Text(
                        filterController.filter[index].name,
                        style: const TextStyle(fontSize: 30.0),
                      ))),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                    width: 300.0,
                    child: Text(
                      "R\$" +
                          filterController.filter[index].price.toString() +
                          "0",
                      style: const TextStyle(fontSize: 20.0),
                    )),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 56.0, right: 56.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            cartController.numberItem(-1, context);
                          },
                          icon: Icon(Icons.remove)),
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Text(cartController.nProduct.toString()),
                        );
                      }),
                      IconButton(
                          onPressed: () {
                            cartController.numberItem(1, context);
                          },
                          icon: const Icon(Icons.add)),
                      const Spacer(),
                      Obx(() {
                        return Text(
                          "TOTAL R\$" +
                              (filterController.filter[index].price *
                                      cartController.nProduct.value)
                                  .toString() +
                              "0",
                          style: const TextStyle(fontSize: 22.0),
                        );
                      }),
                    ],
                  )),
              GestureDetector(
                onTap: () {
                  cartController.addProduct(
                      true,
                      context,
                      index,
                      cartController.nProduct.value,
                      cartController.nProduct.value);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                      height: 50.0,
                      color: const Color(0xffF30000),
                      width: 300.0,
                      child: const Center(
                          child: Text(
                        "Add to the Shopping Cart",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Color(0xffFFFFFF),
                        ),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
