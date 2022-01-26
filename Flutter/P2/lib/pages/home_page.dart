import 'package:flutter/material.dart';
import 'package:estagioapp/pages/item_page.dart';

import 'package:estagioapp/models/item.dart';

class HomePage extends StatefulWidget {
  List<Item> items = [];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  void add() {
    if (newTaskCtrl.text.isEmpty) return;
    widget.items.add(Item(title: newTaskCtrl.text, done: false));
    newTaskCtrl.text = "";
    setState(() {});
  }

  void remove(int index) {
    widget.items.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
              labelText: "Nova Tarefa",
              labelStyle: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          return Container(
            child: Dismissible(
              child: GestureDetector(
                  child: CheckboxListTile(
                    title: Text((item.title).toString()),
                    key: Key((item.title).toString()),
                    value: item.done,
                    onChanged: (value) {
                      item.done = value!;
                      setState(() {});
                    },
                  ),
                  onLongPress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemPage(
                                item,
                                onTitleChanged: (s) {
                                  item.title = s;
                                  setState(() {});
                                },
                                onPositionChanged: (n) {
                                  if (index == n) return;
                                  widget.items.insert(
                                      n + (n > widget.items.length ? 1 : -1),
                                      Item(title: item.title, done: item.done));
                                  remove(index);
                                  setState(() {});
                                },
                              )))),
              key: Key((item.title).toString()),
              background: Container(color: Colors.blue.withOpacity(0.6)),
              onDismissed: (direction) {
                remove(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          onPressed: add,
          child: Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
