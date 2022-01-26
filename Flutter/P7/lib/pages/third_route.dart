import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p7/controllers/item_controler.dart';

class ThirdRoute extends StatelessWidget {
  final int index;
  final itemController = Get.put(ItemController());

  ThirdRoute({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Flutter',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            Container(
              width: 252,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black),
                color: Colors.blue,
              ),
              margin: const EdgeInsets.only(top: 28.0),
              child: Container(
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text(itemController.items[index].name,
                        style: TextStyle(fontSize: 12)),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: Text(
                      "P" + (index + 1).toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              width: 252,
              height: 54,
              margin: const EdgeInsets.only(top: 17.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black),
                color: Colors.white,
              ),
              child: TextField(
                controller: itemController.positioncontroller,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Position',
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                itemController.change(index, context);
              },
              child: Container(
                width: 252,
                height: 54,
                padding: EdgeInsets.fromLTRB(90, 19, 90, 19),
                margin: const EdgeInsets.only(bottom: 18.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black)),
                child: Center(child: Text('Confirmar')),
              ),
            ),
            GestureDetector(
              onTap: () {
                itemController.change(index, context);
              },
              child: Container(
                width: 252,
                height: 54,
                padding: EdgeInsets.fromLTRB(90, 19, 90, 19),
                margin: const EdgeInsets.only(bottom: 18.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black)),
                child: Center(child: Text('Deletar')),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
