import 'package:flutter/material.dart';
import 'package:whatsapp_page/pages/chat_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff075E55),
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Icons.search,
              color: Color(0xffFFFFFF),
            ),
            iconSize: 25,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Color(0xffFFFFFF),
            ),
            iconSize: 25,
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Color(0xffFFFFFF),
          isScrollable: true,
          tabs: [
            Tab(
              child: Icon(
                Icons.camera_alt,
                size: 25.0,
                color: Color(0xffFFFFFF),
              ),
            ),
            Tab(
              child: Text(
                "conversas",
                style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
              ),
            ),
            Tab(
              child: Text(
                "status",
                style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
              ),
            ),
            Tab(
              child: Text(
                "chamadas",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Camera(),
          Conversas(),
          Status(),
          Chamadas(),
        ],
      ),
    );
  }
}

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff01B19B),
      child: Icon(
        Icons.camera_alt,
        color: Color(0xffFFFFFF),
      ),
    );
  }
}

class Chat {
  String contact;
  List<String> messages;
  Chat(this.contact, this.messages);
}

class Conversas extends StatefulWidget {
  @override
  _ConversasState createState() => _ConversasState();
}

class _ConversasState extends State<Conversas> {
  List<Chat> chats = [Chat("Pedro", []), Chat("Joao", [])];

  int lastmessage(index) {
    if (chats[index].messages.length > 0) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xffFFFFFF),
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: GestureDetector(
                  onTap: () async {
                    List<String> aux = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          usermessage: chats[index].messages,
                          username: chats[index].contact,
                        ),
                      ),
                    );
                    if (aux[0] == "" || aux.isEmpty) {
                    } else {
                      chats[index].messages = aux;
                    }

                    setState(() {});
                  },
                  child: Container(
                    color: Color(0xffFFFFFF),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 9.0),
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
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, left: 20.0),
                              child: Container(
                                child: Text(
                                  chats[index].contact,
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 20.0, bottom: 20),
                              child: Container(
                                child: Text(
                                  chats[index].messages.isNotEmpty
                                      ? chats[index].messages[
                                          chats[index].messages.length -
                                              lastmessage(index)]
                                      : "Ultima Mensagem",
                                  style: TextStyle(
                                    color: Color(0xff7B7B7B),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                        Spacer(),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25.0, right: 10.0),
                              child: Text("19:20",
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color(0xff7B7B7B))),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, right: 10.0),
                              child: Icon(
                                Icons.volume_off,
                                color: Color(0xff7B7B7B),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Color(0xff20C65A),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            Icons.message,
            size: 30.0,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff01B19B),
      child: Icon(
        Icons.stay_current_portrait_sharp,
        color: Color(0xffFFFFFF),
      ),
    );
  }
}

class Chamadas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff01B19B),
      child: Icon(
        Icons.phone,
        color: Color(0xffFFFFFF),
      ),
    );
  }
}
