import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:p8/controllers/cart_controller.dart';
import 'package:p8/controllers/item_controller.dart';

class CartPage extends StatelessWidget {
  final itemController = Get.put(ItemController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xffF30000),
          title: Padding(
            padding: EdgeInsets.only(left: 88.0),
            child: Text(
              'STORE',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
        body: Container(
          color: Color(0xffF30000),
          child: Column(children: <Widget>[
            Visibility(
                visible: cartController.emptyCart(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Container(
                      width: 412.0,
                      height: 300.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Container(
                                child: Icon(
                              Icons.shopping_bag,
                              size: 50.0,
                              color: Color(0xffFFFFFF),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text("Shopping Cart is Empty!",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Color(0xffFFFFFF),
                                )),
                          ),
                        ],
                      )),
                )),
            Visibility(
              visible: !cartController.emptyCart(),
              child: Container(
                  height: 500.0,
                  color: Color(0xffFFFFFF),
                  child: GetX<ItemController>(builder: (controller) {
                    return ListView.builder(
                        itemCount: cartController.cart.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: Color(0xffF30000))),
                              color: Color(0xffFFFFFF),
                            ),
                            width: 100.0,
                            height: 100.0,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Container(
                                    child: Icon(cartController
                                        .cart[index].item.picture),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Container(
                                    child: Text(
                                        cartController.cart[index].item.name),
                                  ),
                                ),
                                Column(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30.0, left: 25.0),
                                    child: Container(
                                      child: Text("R\$" +
                                          cartController.cart[index].item.price
                                              .toString() +
                                          "0"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 25.0),
                                    child: Container(
                                      child: Text(cartController
                                              .cart[index].amount
                                              .toString() +
                                          "und"),
                                    ),
                                  ),
                                ]),
                                Obx(() {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Container(
                                      child: Text("R\$" +
                                          (cartController
                                                      .cart[index].item.price *
                                                  cartController
                                                      .cart[index].amount)
                                              .toString() +
                                          "0"),
                                    ),
                                  );
                                }),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    cartController.removeItem(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 25.0),
                                    child: Container(
                                      color: Color(0xffF30000),
                                      child: Icon(
                                        Icons.clear_rounded,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  })),
            ),
            Visibility(
              visible: !cartController.emptyCart(),
              child: Container(
                color: Color(0xffF30000),
                child: Column(children: <Widget>[
                  Obx(() {
                    return Row(children: <Widget>[
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          child: Text(
                            "Cart Total Price:",
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Container(
                          child: Text(
                            "R\$" + cartController.totalprice.toString() + "0",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]);
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 5),
                    child: Row(children: <Widget>[
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          cartController.cleanCart(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffFFFFFF)),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Clean Cart",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff000000)),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.delete))
                          ]),
                        ),
                      )
                    ]),
                  ),
                ]),
              ),
            )
          ]),
        ));
  }
}
