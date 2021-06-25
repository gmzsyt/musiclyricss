import 'dart:convert';

import 'package:flutter/services.dart';

class LyricsApi{
  Future<List> lyricsApi() async {
    List list = [];
    try {
      String contents = await rootBundle.loadString('assets/lyricsApi.txt');
        list = json.decode(contents);
      return list;
    } catch (e) {
      return list;
    }
  }
}