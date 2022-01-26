import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool a = true;

  Icon icon_eye(a) {
    if (a == true) {
      return Icon(
        Icons.remove_red_eye_outlined,
        size: 27,
        color: Color(0xffFFFFFF),
      );
    } else {
      return Icon(
        Icons.visibility_off_outlined,
        size: 27,
        color: Color(0xffFFFFFF),
      );
    }
  }

  Color color_account(a) {
    if (a == true) {
      return Color(0xffFFFFFF);
    } else {
      return Color(0xffF0F1F5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff820AD2),
        child: ListView(
          children: <Widget>[
            Container(
              color: Color(0xff820AD2),
              width: 414,
              height: 148,
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 17.0, top: 25.0, bottom: 25.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Color(0xff9A3BDA),
                          border: Border.all(color: Color(0xff9A3BDA)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.person_outlined,
                            size: 35,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 202.0, top: 30.0, bottom: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (a == true)
                              a = false;
                            else
                              a = true;
                          });
                        },
                        child: icon_eye(a),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, top: 35.0, bottom: 30.0),
                      child: Container(
                        width: 27,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffFFFFFF), width: 3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, top: 30.0, bottom: 30.0),
                      child: Container(
                        child: Icon(
                          Icons.mail_outline_sharp,
                          size: 27,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0, bottom: 19.0),
                    child: Text(
                      "Olá, Pedro",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                )
              ]),
            ),
            Container(
              color: Color(0xffFFFFFF),
              width: 414,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 28.0, left: 23.0),
                            child: Text(
                              "Conta",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 25,
                              ),
                            ),
                          )),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 28.0, left: 269.0),
                          child: Icon(Icons.arrow_forward_ios, size: 18),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 23.0),
                      child: Container(
                        height: 30.0,
                        color: color_account(a),
                        width: 248.0,
                        child: Visibility(
                          visible: (a == true),
                          child: Text(
                            "R\$159.654,00",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35),
                    child: Container(
                      height: 125.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 75.0,
                                height: 122.0,
                                child: Column(children: <Widget>[
                                  Container(
                                    width: 71.0,
                                    height: 71.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF0F1F5),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.open_with_rounded,
                                      size: 21,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      "Pix",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 75.0,
                                height: 122.0,
                                child: Column(children: <Widget>[
                                  Container(
                                    width: 71.0,
                                    height: 71.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF0F1F5),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.qr_code_2,
                                      size: 21,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      "Pagar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 75.0,
                                height: 122.0,
                                child: Column(children: <Widget>[
                                  Container(
                                    width: 71.0,
                                    height: 71.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF0F1F5),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.upload,
                                      size: 21,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      "Transferir",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 75.0,
                                height: 122.0,
                                child: Column(children: <Widget>[
                                  Container(
                                    width: 71.0,
                                    height: 71.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF0F1F5),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.download,
                                      size: 21,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      "Depositar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 75.0,
                                height: 122.0,
                                child: Column(children: <Widget>[
                                  Container(
                                    width: 71.0,
                                    height: 71.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF0F1F5),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.smartphone,
                                      size: 21,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      "Recarga de celular",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 75.0,
                                height: 122.0,
                                child: Column(children: <Widget>[
                                  Container(
                                    width: 71.0,
                                    height: 71.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF0F1F5),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.add,
                                      size: 21,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      "Adicionar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 75.0,
                                height: 122.0,
                                child: Column(children: <Widget>[
                                  Container(
                                    width: 71.0,
                                    height: 71.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF0F1F5),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.saved_search,
                                      size: 21,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      "Procurar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 23.0),
                    child: Container(
                      height: 55.0,
                      width: 367,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xffF0F1F5)),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Meus cartões",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Container(
                      width: 414.0,
                      height: 2.0,
                      color: Color(0xffF0F1F5),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, left: 23.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 23.0),
                            child: Text(
                              "Cartão de crédito",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 183.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 14.0, left: 23.0),
                          child: Text(
                            "Fatura Atual",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff737583)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 23.0),
                          child: Container(
                            height: 30.0,
                            color: color_account(a),
                            width: 248.0,
                            child: Visibility(
                              visible: (a == true),
                              child: Text(
                                "R\$0,00",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 7.0, left: 23.0),
                          child: Text("Limite disponível de R\$ 10.000,00"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Container(
                          width: 414.0,
                          height: 2.0,
                          color: Color(0xffF0F1F5),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 23.0, top: 20.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 23.0, top: 20.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Empréstimo",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: 228.0,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Container(
                          width: 414.0,
                          height: 2.0,
                          color: Color(0xffF0F1F5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
