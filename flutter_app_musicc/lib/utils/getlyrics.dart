import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class GetLyrics{
 Future getlyrics(String url) async{
  Response response = await http.get(Uri.parse(url));
  List list = [];
  list.add(json.decode(response.body));
  String lyric = list[0]["lyrics"];
  return lyric;
  }
}