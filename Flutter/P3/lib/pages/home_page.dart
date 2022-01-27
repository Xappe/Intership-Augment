import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MaterialColor color_top_screen = Colors.blue;
  var now = DateTime.now();
  String DefineMonth(var now) {
    if (now == 1)
      return "January";
    else if (now == 2)
      return "February";
    else if (now == 3)
      return "March ";
    else if (now == 4)
      return "April ";
    else if (now == 5)
      return "May ";
    else if (now == 6)
      return "June ";
    else if (now == 7)
      return "July ";
    else if (now == 8)
      return "August ";
    else if (now == 9)
      return "September ";
    else if (now == 10)
      return "October ";
    else if (now == 11)
      return "November ";
    else if (now == 12)
      return "December";
    else
      return "ERROR";
  }

  double x = 1000.00;
  Color DefineMoneyColor(double v) {
    if (v > 0)
      return Colors.green;
    else
      return Colors.red;
  }

  IconData DefineIconList(double v) {
    if (v > 0)
      return Icons.monetization_on;
    else
      return Icons.cancel_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_top_screen,
        shadowColor: null,
        elevation: 0.0,
        title: Center(child: Text("Extract")),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.replay_sharp,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
              width: 412.0,
              height: 170.0,
              color: color_top_screen,
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                      width: 270.0,
                      height: 68.3,
                      color: color_top_screen,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 130.0),
                        child: Text(
                          "Balance Available",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 122,
                      height: 68.3,
                      color: color_top_screen,
                        child: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.white,
                            )),
                    ),
                    Spacer()
                  ]),
                  Container(
                    width: 206.0,
                    height: 68.3,
                    color: color_top_screen,
                    child: Center(
                        child: Text(
                      "R\$ 2180.00",
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ],
              )),
          Container(
              width: 412.0,
              height: 35.0,
              decoration: BoxDecoration(
                  border: Border.all(color: color_top_screen),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 25.0),
                child: Text(
                  "${now.day} de ${DefineMonth(now.month)}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )),
          Container(
            width: 412.0,
            height: 390.0,
            decoration: BoxDecoration(
                border: Border.all(color: color_top_screen),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        null;
                      },
                      child: Container(
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          Container(
                            height: 35,
                            child: Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Transaction',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 220,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "R\$ 1000.00",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(right: 180),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                  color: Colors.grey,
                                  width: 3.0,
                                )),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Source/Destiny',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            width: 162.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                  color: Colors.grey,
                                  width: 3.0,
                                )),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 21.0),
                              child: Text(
                                '${now.hour}:${now.minute}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        null;
                      },
                      child: Container(
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          Container(
                            height: 35,
                            child: Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Transaction',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 220,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "R\$ 1000.00",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(right: 180),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                  color: Colors.grey,
                                  width: 3.0,
                                )),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Source/Destiny',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            width: 162.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                  color: Colors.grey,
                                  width: 3.0,
                                )),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 21.0),
                              child: Text(
                                '${now.hour}:${now.minute}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        null;
                      },
                      child: Container(
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          Container(
                            height: 35,
                            child: Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Transaction',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 220,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "R\$ 1000.00",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(right: 180),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                  color: Colors.grey,
                                  width: 3.0,
                                )),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Source/Destiny',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            width: 162.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                  color: Colors.grey,
                                  width: 3.0,
                                )),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 21.0),
                              child: Text(
                                '${now.hour}:${now.minute}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        null;
                      },
                      child: Container(
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          Container(
                            height: 35,
                            child: Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                'Transaction',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 220,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "R\$ 1000.00",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(right: 180),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                  color: Colors.grey,
                                  width: 3.0,
                                )),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Source/Destiny',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            width: 162.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                  color: Colors.grey,
                                  width: 3.0,
                                )),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 21.0),
                              child: Text(
                                '${now.hour}:${now.minute}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
