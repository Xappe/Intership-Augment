import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:p9/controllers/video_controller.dart';

class MyVideoPage extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xff000000),
          title: Text(
            "Logo",
            style: TextStyle(fontSize: 30, color: Colors.orange),
          ),
        ),
        body: Column(children: <Widget>[
          Container(
            width: 412.0,
            height: 39.0,
            color: Colors.orange,
            child: Center(
              child: Text(
                "My Video List",
                style: TextStyle(fontSize: 25, color: Color(0xff000000)),
              ),
            ),
          ),
          Obx(() {
            return Container(
              height: 500.4,
              color: Colors.black,
              child: ListView.builder(
                  itemCount: videoController.myVideos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        color: Colors.orange,
                        height: 80.0,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(children: <Widget>[
                              Container(
                                width: 300,
                                child: Text(
                                  videoController.myVideos[index].title,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: GestureDetector(
                                    child: Icon(Icons.edit),
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: 412.0,
                                              color: Color(0xffFFFFFF),
                                              child: Column(children: <Widget>[
                                                Container(
                                                  width: 412.0,
                                                  height: 50.0,
                                                  color: Colors.orange,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 40.0),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        color: Colors.orange,
                                                        child: Row(
                                                            children: <Widget>[
                                                              Text("Edit Video",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20.0,
                                                                      color: Color(
                                                                          0xffFFFFFF))),
                                                              Icon(Icons.edit,
                                                                  size: 30.0,
                                                                  color: Color(
                                                                      0xffFFFFFF)),
                                                            ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 412.0,
                                                  height: 334.4,
                                                  color: Color(0xff000000),
                                                  child:
                                                      Column(children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      child: Text(
                                                        "TITLE",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      child: Container(
                                                        width: 300.0,
                                                        height: 35.0,
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        child: TextField(
                                                          controller:
                                                              videoController
                                                                  .titleController,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                          decoration:
                                                              InputDecoration(
                                                            floatingLabelStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        0),
                                                            labelText:
                                                                videoController
                                                                    .myVideos[
                                                                        index]
                                                                    .title,
                                                            labelStyle: TextStyle(
                                                                color: Color(
                                                                    0xff000000)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      child: Text(
                                                        "URL",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0,
                                                              bottom: 10.0),
                                                      child: Container(
                                                        width: 300.0,
                                                        height: 35.0,
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        child: TextField(
                                                          controller:
                                                              videoController
                                                                  .urlController,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                          decoration:
                                                              InputDecoration(
                                                            floatingLabelStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        0),
                                                            labelText:
                                                                videoController
                                                                    .myVideos[
                                                                        index]
                                                                    .url,
                                                            labelStyle: TextStyle(
                                                                color: Color(
                                                                    0xff000000)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          videoController
                                                              .editMyVideos(
                                                                  index);
                                                        },
                                                        child: Container(
                                                            color:
                                                                Colors.orange,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                  "Aply Edition",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xffFFFFFF),
                                                                    fontSize:
                                                                        25.0,
                                                                  )),
                                                            )),
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ]),
                                            );
                                          });
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    videoController
                                        .deleteVideoToPlaylist(index);
                                  },
                                  child: Icon(Icons.delete),
                                ),
                              ),
                            ])));
                  }),
            );
          }),
          Container(
            color: Colors.orange,
            height: 64.0,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Container(
                    color: Color(0xff000000),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: 412.0,
                                  color: Color(0xffFFFFFF),
                                  child: Column(children: <Widget>[
                                    Container(
                                      width: 412.0,
                                      height: 50.0,
                                      color: Colors.orange,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 40.0),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            color: Colors.orange,
                                            child: Row(children: <Widget>[
                                              Text("Add Video",
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color:
                                                          Color(0xffFFFFFF))),
                                              Icon(Icons.edit,
                                                  size: 30.0,
                                                  color: Color(0xffFFFFFF)),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 412.0,
                                      height: 334.4,
                                      color: Color(0xff000000),
                                      child: Column(children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "TITLE",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Container(
                                            width: 300.0,
                                            height: 35.0,
                                            color: Color(0xffFFFFFF),
                                            child: TextField(
                                              controller: videoController
                                                  .titleController,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                              decoration: InputDecoration(
                                                floatingLabelStyle:
                                                    TextStyle(fontSize: 0),
                                                labelText: "Insert Title",
                                                labelStyle: TextStyle(
                                                    color: Color(0xff000000)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "URL",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                          child: Container(
                                            width: 300.0,
                                            height: 35.0,
                                            color: Color(0xffFFFFFF),
                                            child: TextField(
                                              controller:
                                                  videoController.urlController,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                              decoration: InputDecoration(
                                                floatingLabelStyle:
                                                    TextStyle(fontSize: 0),
                                                labelText: "Insert Url",
                                                labelStyle: TextStyle(
                                                    color: Color(0xff000000)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              videoController
                                                  .addMyVideos(context);
                                            },
                                            child: Container(
                                                color: Colors.orange,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("Add New Video",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        fontSize: 25.0,
                                                      )),
                                                )),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ]),
                                );
                              });
                        },
                        child: Row(children: <Widget>[
                          Text("Add new video",
                              style: TextStyle(color: Color(0xffFFFFFF))),
                          Icon(Icons.add, color: Color(0xffFFFFFF)),
                        ]),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Container(
                    color: Color(0xff000000),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          videoController.cleanMyVideos();
                        },
                        child: Row(children: <Widget>[
                          Text("Clear all videos",
                              style: TextStyle(color: Color(0xffFFFFFF))),
                          Icon(Icons.delete, color: Color(0xffFFFFFF)),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
