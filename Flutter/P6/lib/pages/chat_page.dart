import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({required this.usermessage, required this.username});
  List<String> usermessage;
  String username;
  @override
  _ChatPage createState() => _ChatPage(usermessage);
}

class _ChatPage extends State<ChatPage> {
  var newMessageCtrl = TextEditingController();
  String checkmessage = "";

  _ChatPage(List<String> usermessage);

  void addmessage(String s) {
    widget.usermessage.insert(widget.usermessage.length, s);
    checkmessage = s;
    newMessageCtrl.text = "";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: 412.0,
          height: 685.0,
          color: Color(0xffE3E5E3),
          child: Column(children: <Widget>[
            Container(
              width: 412.0,
              height: 95.0,
              color: Color(0xff075E55),
              child: Row(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (checkmessage == "")
                      Navigator.pop(context, [""]);
                    else
                      Navigator.pop(context, widget.usermessage);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.0, left: 8.0),
                    child: Icon(
                      Icons.arrow_back,
                      size: 25.0,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffCED8DF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 55.0,
                      color: Color(0xffFEFEFE),
                    ),
                  ),
                ),
                Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 35.0, left: 10.0),
                    child: Container(
                      child: Text(
                        widget.username,
                        style:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 18.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Container(
                      child: Text(
                        "Online",
                        style:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 14.0),
                      ),
                    ),
                  ),
                ]),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 25.0),
                  child: Icon(
                    Icons.videocam,
                    color: Color(0xffFFFFFF),
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 25.0),
                  child: Icon(
                    Icons.phone,
                    color: Color(0xffFFFFFF),
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 15.0),
                  child: Icon(
                    Icons.more_vert,
                    color: Color(0xffFFFFFF),
                    size: 30.0,
                  ),
                ),
              ]),
            ),
            Container(
              width: 412.0,
              height: 515.0,
              color: Color(0xffE3E5E3),
              child: ListView.builder(
                  itemCount: widget.usermessage.length,
                  itemBuilder: (context, index) {
                    return Row(children: [
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 60.0, right: 20.0, bottom: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffE2FFC7),
                            border: Border.all(
                              color: Color(0xffE2FFC7),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.usermessage[index],
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]);
                  }),
            ),
            Spacer(),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    border: Border.all(
                      color: Color(0xffFFFFFF),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.emoji_emotions_outlined,
                          color: Color(0xff7C7D7F),
                          size: 25.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                        child: SizedBox(
                          width: 100.0,
                          height: 53.0,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Mensagem',
                              hintStyle: TextStyle(color: Color(0xffA8A8A8)),
                            ),
                            controller: newMessageCtrl,
                            onSubmitted: addmessage,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 95.0),
                        child: Icon(
                          Icons.attach_file,
                          color: Color(0xff83888C),
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 15.0),
                        child: Icon(
                          Icons.camera_alt,
                          color: Color(0xff83888C),
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, left: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff00887A),
                    border: Border.all(
                      color: Color(0xff00887A),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.mic,
                      color: Color(0xffFFFFFF),
                      size: 30,
                    ),
                  ),
                ),
              ),
            ])
          ]),
        ));
  }
}
