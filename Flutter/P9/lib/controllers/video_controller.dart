import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p9/models/video.dart';
import 'package:p9/pages/my_video_page.dart';
import 'package:p9/pages/playlist_page.dart';
import 'package:p9/pages/video_page.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  TextEditingController comentController = TextEditingController();
  late YoutubePlayerController youtubeController;
  bool check = true;

  Video aux = Video(
      title: "",
      url: "https://www.youtube.com/watch?v=uAOR6ib95kQ",
      like: 0,
      dislike: 0,
      coments: <String>[]);

  RxList<String> coments = <String>[].obs;
  int videoIndex = 0;

  @override
  void onInit() {
    runYoutubePlayer();
    super.onInit();
  }

  RxList<Video> videos = <Video>[
    Video(
      title: "Calcinha Preta - Como Vou Deixar Você",
      url: "https://www.youtube.com/watch?v=2BrrDhLFfeM",
      like: 1526,
      dislike: 25,
      coments: <String>[],
    ),
    Video(
      title: "Gorillaz - DARE (Official Video)",
      url: "https://www.youtube.com/watch?v=uAOR6ib95kQ",
      like: 6525,
      dislike: 25,
      coments: <String>[],
    ),
    Video(
      title: "Kendrick Lamar - HUMBLE.",
      url: "https://www.youtube.com/watch?v=tvTRZJ-4EyI",
      like: 521,
      dislike: 25,
      coments: <String>[],
    ),
    Video(
      title: "Mumuzinho - Fulminante (Ao Vivo)",
      url: "https://www.youtube.com/watch?v=1HPyLrS4iX4",
      like: 5846,
      dislike: 25,
      coments: <String>[],
    ),
    Video(
      title: "Ara Ketu - Cobertor (Live Video)",
      url: "https://www.youtube.com/watch?v=wiEEhhmxezs",
      like: 9633,
      dislike: 25,
      coments: <String>[],
    ),
  ].obs;

  RxList<Video> myVideos = <Video>[
    Video(
      title: "Gorillaz - DARE (Official Video)",
      url: "https://www.youtube.com/watch?v=uAOR6ib95kQ",
      like: 6525,
      dislike: 25,
      coments: <String>[],
    ),
    Video(
      title: "Kendrick Lamar - HUMBLE.",
      url: "https://www.youtube.com/watch?v=tvTRZJ-4EyI",
      like: 521,
      dislike: 25,
      coments: <String>[],
    ),
  ].obs;

  RxList<Video> playlist = <Video>[].obs;

  void runYoutubePlayer() {
    youtubeController = YoutubePlayerController(
        initialVideoId: YoutubePlayerController.convertUrlToId(aux.url)!,
        params: const YoutubePlayerParams(
          loop: true,
          color: 'transparent',
          desktopMode: true,
          strictRelatedVideos: true,
          showFullscreenButton: !kIsWeb,
        ));
  }

  void goVideoPage(int index, BuildContext context, bool i) {
    if (i == true) {
      aux = videos[index];
      coments.value = videos[index].coments;
    } else {
      if (i == false) {
        aux = playlist[index];
        coments.value = playlist[index].coments;
        check = false;
      }
    }
    videoIndex = index;

    runYoutubePlayer();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VideoPage()));
  }

  void goEditVideoPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyVideoPage()));
  }

  void addComent(String s) {
    if (check == true) {
      videos[videoIndex].coments.add(s);
      comentController.text = "";
      aux.coments = videos[videoIndex].coments;
      for (int i = 0; i < playlist.length; i++) {
        if (playlist[i].title == videos[videoIndex].title) {
          playlist[i].coments = videos[videoIndex].coments;
        }
      }
    } else {
      if (check == false) {
        playlist[videoIndex].coments.add(s);
        comentController.text = "";
        aux.coments = playlist[videoIndex].coments;
        for (int i = 0; i < videos.length; i++) {
          if (playlist[videoIndex].title == videos[i].title) {
            videos[i].coments = playlist[videoIndex].coments;
          }
        }
      }
    }
    coments.value = videos[videoIndex].coments;
    coments.refresh();
  }

  void deletComent(int index) {
    videos[videoIndex].coments.removeAt(index);
    aux.coments = videos[videoIndex].coments;
    coments.value = videos[videoIndex].coments;
    coments.refresh();
  }

  void addVideoToPlaylist() {
    for (int i = 0; i < playlist.length; i++) {
      if (playlist[i].title == videos[videoIndex].title) {
        print("Video already insert in playlist");
        return;
      }
    }
    playlist.add(Video(
        title: videos[videoIndex].title,
        url: videos[videoIndex].url,
        like: videos[videoIndex].like,
        dislike: videos[videoIndex].dislike,
        coments: videos[videoIndex].coments));
    print("Add");
  }

  void deleteVideoToPlaylist(int index) {
    for (int i = 0; i < playlist.length; i++) {
      if (myVideos[index].title == playlist[i].title) {
        playlist.removeAt(i);
      }

      if (myVideos[index].title == videos[i].title) {
        videos.removeAt(i);
        print("ok");
      }
      myVideos.removeAt(index);

      print("Delete");
    }
  }

  void goPlaylistPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PlaylistPage()));
  }

  void updatePlaylist() {
    for (int i = 0; i < videos.length; i++) {
      for (int j = 0; j < playlist.length; j++) {
        if (playlist[j].title == videos[i].title) {
          playlist[j] = videos[i];
        }
      }
    }
  }

  void addMyVideos(BuildContext context) {
    bool check = false;
    if (titleController.text == "" || urlController.text == "") {
      titleController.text = "";
      urlController.text = "";
      print("title or url is blank ");
    } else {
      for (int j = 0; j < videos.length; j++) {
        if (titleController.text == videos[j].title ||
            urlController.text == videos[j].url) {
          check = true;
          print("This video already in List");
          titleController.text = "";
          urlController.text = "";
        }
      }

      if (check != true) {
        videos.add(Video(
            title: titleController.text,
            url: urlController.text,
            like: 0,
            dislike: 0,
            coments: <String>[]));
        myVideos.add(Video(
            title: titleController.text,
            url: urlController.text,
            like: 0,
            dislike: 0,
            coments: <String>[]));
        titleController.text = "";
        urlController.text = "";
        Navigator.pop(context);
      }
    }
  }

  void deletePlaylist(int index) {
    playlist.removeAt(index);
    playlist.refresh();
  }

  void cleanPlaylist() {
    playlist.clear();
    playlist.refresh();
  }

  void cleanMyVideos() {
    for (int j = 0; j < myVideos.length; j++) {
      for (int i = 0; i < videos.length; i++) {
        if (myVideos[j].title == videos[i].title) {
          videos.removeAt(i);
        }
      }
      for (int i = 0; i < playlist.length; i++) {
        if (myVideos[j].title == playlist[i].title) {
          playlist.removeAt(i);
        }
      }
    }

    myVideos.clear();
    myVideos.refresh();
    videos.refresh();
    playlist.refresh();
  }

  void editMyVideos(int index) {
    if (titleController.text != "" &&
        titleController.text != myVideos[index].title) {
      for (int i = 0; i < videos.length; i++) {
        if (myVideos[index].title == videos[i].title) {
          videos[i].title = titleController.text;
        }
      }
      myVideos[index].title = titleController.text;
    }

    if (urlController.text != "" && urlController.text != myVideos[index].url) {
      for (int i = 0; i < videos.length; i++) {
        if (myVideos[index].url == videos[i].url) {
          videos[i].url = urlController.text;
        }
      }
      myVideos[index].url = urlController.text;
    }
    titleController.text = "";
    urlController.text = "";

    myVideos.refresh();
    videos.refresh();
  }
}
