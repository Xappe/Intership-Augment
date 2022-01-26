import 'package:flutter/material.dart';

class Video {
  String title;
  String url;
  int like;
  int dislike;
  List<String> coments;

  Video(
      {required this.title,
      required this.url,
      required this.like,
      required this.dislike,
      required this.coments});
}
