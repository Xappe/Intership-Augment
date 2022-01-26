import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

TextEditingController nameController = TextEditingController();

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class Item {
  dynamic name;
  MaterialColor colorcontainer;
  double sizebutton;
  int route;

  Item(
      {required this.name,
      required this.colorcontainer,
      required this.sizebutton,
      required this.route});
}

class _State extends State<MyApp> {
  final List<Item> itens = [];

  void addItemToList(String s) {
    final item = Item(
      name: s,
      colorcontainer: Colors.orange,
      sizebutton: 29,
      route: 0,
    );
    nameController.text = "";
    setState(() {
      itens.add(item);
    });
  }

  void deletItemToList(int index) {
    setState(() {
      itens.removeAt(index);
    });
  }

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
          child: Column(children: <Widget>[
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 70.0),
              height: 40,
              width: 252,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: TextField(
                  onSubmitted: addItemToList,
                  controller: nameController,
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insert',
                  ),
                ),
              ),
            ),
            Container(
                height: 400,
                width: 252,
                child: ListView.builder(
                    itemCount: itens.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: 252,
                          height: 54,
                          padding: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                          child: GestureDetector(
                              onTap: () async {
                                dynamic retornopag = await Navigator.push(
                                    context,
                                    itens[index].route == 0
                                        ? MaterialPageRoute(
                                            builder: (context) => SecondRoute(
                                                user: itens[index].name,
                                                position: index))
                                        : MaterialPageRoute(
                                            builder: (context) => ThirdRoute(
                                                user: itens[index].name,
                                                position: index)));
                                if (retornopag == null) return;
                                Item aux = retornopag;
                                if (aux.name == "Delet" && aux.name != "") {
                                  deletItemToList(index);
                                } else {
                                  itens[index].name = aux.name;
                                }

                                if (aux.route != index && aux.route != -1) {
                                  print(aux.route);
                                  String a = itens[index].name;
                                  MaterialColor b = itens[index].colorcontainer;
                                  double c = itens[index].sizebutton;
                                  int d = itens[index].route;

                                  itens[index].name = itens[aux.route].name;
                                  itens[index].colorcontainer =
                                      itens[aux.route].colorcontainer;
                                  itens[index].sizebutton =
                                      itens[aux.route].sizebutton;
                                  itens[index].route = itens[aux.route].route;

                                  itens[aux.route].name = a;
                                  itens[aux.route].colorcontainer = b;
                                  itens[aux.route].sizebutton = c;
                                  itens[aux.route].route = d;
                                }

                                setState(() {});
                              },
                              child: AnimatedContainer(
                                  duration: Duration(seconds: 0),
                                  decoration: BoxDecoration(
                                      color: itens[index].colorcontainer,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                      child: Row(children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.only(left: 20.0),
                                        width: 150,
                                        child: Text(
                                          itens[index].name,
                                          style: TextStyle(fontSize: 9),
                                        )),
                                    itens[index].route == 0
                                        ? Container(
                                            margin: const EdgeInsets.only(
                                                left: 60, top: 5, bottom: 5),
                                            width: itens[index].sizebutton,
                                            color: Colors.red,
                                            child: GestureDetector(onTap: () {
                                              setState(() {
                                                itens[index].colorcontainer =
                                                    Colors.blue;
                                                itens[index].route = 1;
                                                itens[index].sizebutton = 0;
                                              });
                                            }))
                                        : Container()
                                  ])))));
                    }))
          ]),
        ));
  }
}

class SecondRoute extends StatelessWidget {
  final String user;
  final int position;
  SecondRoute({Key? key, required this.user, required this.position})
      : super(key: key);

  final textcontroller = TextEditingController();
  final positioncontroller = TextEditingController();

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
                color: Colors.orange,
              ),
              margin: const EdgeInsets.only(top: 28.0),
              child: Container(
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text(user, style: TextStyle(fontSize: 12)),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: Text(
                      "P" + (position + 1).toString(),
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
                controller: textcontroller,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Insert',
                ),
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
                controller: positioncontroller,
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
                String a = positioncontroller.text;
                int b = -1;
                if (a != "") {
                  b = (int.parse(a) - 1);
                }

                final aux = Item(
                    name: textcontroller.text,
                    colorcontainer: Colors.orange,
                    sizebutton: 29,
                    route: b);

                Navigator.pop(context, aux);
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
                final aux = Item(
                    name: "Delet",
                    colorcontainer: Colors.orange,
                    sizebutton: 29,
                    route: 0);
                Navigator.pop(context, aux);
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

class ThirdRoute extends StatelessWidget {
  final String user;
  final int position;
  ThirdRoute({Key? key, required this.user, required this.position})
      : super(key: key);

  final positioncontroller = TextEditingController();

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
                    child: Text(user, style: TextStyle(fontSize: 12)),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: Text(
                      "P" + (position + 1).toString(),
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
                controller: positioncontroller,
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
                String a = positioncontroller.text;
                int b = -1;
                if (a != "") {
                  b = (int.parse(a) - 1);
                }

                final aux = Item(
                    name: "",
                    colorcontainer: Colors.blue,
                    sizebutton: 0,
                    route: b);

                Navigator.pop(context, aux);
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
                final aux = Item(
                    name: "Delet",
                    colorcontainer: Colors.orange,
                    sizebutton: 29,
                    route: 0);
                Navigator.pop(context, aux);
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
