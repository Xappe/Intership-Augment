import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:p9/controllers/video_controller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPage extends StatelessWidget {
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
      body: Container(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 2.0, right: 2.0),
            child: SizedBox(
                width: 413.0,
                child: YoutubePlayerControllerProvider(
                    controller: videoController.youtubeController,
                    child: YoutubePlayerIFrame(
                      controller: videoController.youtubeController,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0),
            child: Container(
                child: Text(videoController.aux.title,
                    style: TextStyle(fontSize: 25.0))),
          ),
          Row(children: <Widget>[
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            Text(videoController.videos[videoController.videoIndex].like
                .toString()),
            IconButton(
              icon: Icon(Icons.thumb_down),
              onPressed: () {},
            ),
            Text(videoController.videos[videoController.videoIndex].dislike
                .toString()),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: Row(
                    children: <Widget>[Icon(Icons.add), Text("Add Playlist")]),
                onTap: () {
                  videoController.addVideoToPlaylist();
                },
              ),
            ),
          ]),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              color: Color(0xff000000),
              width: 412.0,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 412.0,
                    color: Colors.orange,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Coments",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff000000))),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    color: Colors.white,
                    child: TextField(
                      onSubmitted: videoController.addComent,
                      controller: videoController.comentController,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(fontSize: 0),
                        border: OutlineInputBorder(),
                        labelText: 'Insert coments',
                        labelStyle: TextStyle(color: Color(0xff000000)),
                      ),
                    ),
                  ),
                  Container(
                      height: 170.0,
                      child: Obx(() {
                        return ListView.builder(
                            itemCount: videoController.coments.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: Color(0xff000000),
                                height: 35.0,
                                child: Row(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      videoController.coments[index],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.orange),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        videoController.deletComent(index);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                              );
                            });
                      })),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
