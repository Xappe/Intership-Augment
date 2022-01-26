import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatefulWidget {
  ItemPage(this.item, {required this.onTitleChanged, required this.onPositionChanged});

  Item item;

  Function(String) onTitleChanged;
  Function(int) onPositionChanged;

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editPositionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Editing"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
              child: Column(
            children: <Widget>[
              Container(
                width: 252,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border(
                    top: BorderSide(width: 2, color: Colors.blue),
                    bottom: BorderSide(width: 2, color: Colors.blue),
                    left: BorderSide(width: 2, color: Colors.blue),
                    right: BorderSide(width: 2, color: Colors.blue),
                  ),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(top: 50.0),
                child: TextField(
                  controller: editTitleController,
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insert New Assigment',
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                width: 252,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border(
                    top: BorderSide(width: 2, color: Colors.blue),
                    bottom: BorderSide(width: 2, color: Colors.blue),
                    left: BorderSide(width: 2, color: Colors.blue),
                    right: BorderSide(width: 2, color: Colors.blue),
                  ),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(top: 50.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: editPositionController,
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Insert New Position',
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
              ),
            ],
          )),
        ),
      ),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          onPressed: () {
            if (editTitleController.text != "") {
              widget.onTitleChanged(editTitleController.text);
            }

            if (editPositionController.text != "") {
              widget.onPositionChanged(int.parse(editPositionController.text) - 1);
            }
            Navigator.pop(context);
          },
          child: Icon(Icons.check),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
