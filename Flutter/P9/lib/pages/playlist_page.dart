import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:p9/controllers/video_controller.dart';

class PlaylistPage extends StatelessWidget {
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
                "My Playlist",
                style: TextStyle(fontSize: 25, color: Color(0xff000000)),
              ),
            ),
          ),
          Container(
            color: Color(0xff000000),
            child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 4.4),
                child: Obx(() {
                  return Container(
                    height: 500.0,
                    child: ListView.builder(
                        itemCount: videoController.playlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              color: Colors.orange,
                              height: 80.0,
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Row(children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        videoController.goVideoPage(
                                            index, context, false);
                                      },
                                      child: Container(
                                        width: 300,
                                        child: Text(
                                          videoController.playlist[index].title,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          videoController.deletePlaylist(index);
                                        },
                                        child: Icon(Icons.delete),
                                      ),
                                    ),
                                  ])));
                        }),
                  );
                })),
          ),
          Container(
            color: Colors.orange,
            width: 412.0,
            height: 50.0,
            child: GestureDetector(
              onTap: () {
                videoController.cleanPlaylist();
              },
              child: Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 150.0),
                  child: Text("Clear all videos",
                      style: TextStyle(color: Color(0xff000000))),
                ),
                Icon(Icons.delete, color: Color(0xff000000)),
              ]),
            ),
          ),
        ]));
  }
}
