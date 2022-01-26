import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:p9/controllers/video_controller.dart';

class HomePage extends StatelessWidget {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              videoController.goPlaylistPage(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              videoController.goEditVideoPage(context);
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xff000000),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Videos",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Obx(() {
                return Container(
                  height: 550.0,
                  child: ListView.builder(
                      itemCount: videoController.videos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.orange,
                          height: 80.0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: GestureDetector(
                              onTap: () {
                                videoController.goVideoPage(
                                    index, context, true);
                              },
                              child: Text(
                                videoController.videos[index].title,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
