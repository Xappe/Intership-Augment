import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p7/controllers/item_controler.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(ItemController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Flutter',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
          child: Column(children: <Widget>[
        GestureDetector(
          child: Container(
            margin: new EdgeInsets.symmetric(horizontal: 70.0),
            height: 40,
            width: 252,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: TextField(
                onSubmitted: (String s) {
                  itemController.additem(s);
                },
                controller: itemController.namecontroller,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Insert',
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 400,
          width: 252,
          child: GetX<ItemController>(builder: (controller) {
            return ListView.builder(
                itemCount: itemController.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 252,
                    height: 50.0,
                    padding: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        itemController.gopage(index, context);
                      },
                      child: AnimatedContainer(
                          duration: Duration(seconds: 0),
                          decoration: BoxDecoration(
                              color: itemController.items[index].colorcontainer,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.black)),
                          child: Container(
                              child: Row(children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(left: 20.0),
                                width: 150,
                                child: Text(
                                  itemController.items[index].name,
                                  style: TextStyle(fontSize: 9),
                                )),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 60, top: 5, bottom: 5),
                                width: itemController.items[index].sizebutton,
                                color: Colors.red,
                                child: GestureDetector(
                                  onTap: () {
                                    itemController.checkbox(index);
                                  },
                                ))
                          ]))),
                    ),
                  );
                });
          }),
        )
      ])),
    );
  }
}
