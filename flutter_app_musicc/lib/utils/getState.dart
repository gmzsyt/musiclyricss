import 'package:get/get.dart';

import 'package:flutter_app_musicc/model/favmodel.dart';

import 'package:flutter_app_musicc/utils/databese_helper.dart';

import '../model/favmodel.dart';

class GetState extends GetxController{
  int _drawerindex = 0;


  int get drawerindex => _drawerindex;

  set drawerindex(int value) {
    _drawerindex = value;
    update();
  }

  List<FavModel> _favlist = [];
  List _favstatistics = [];


  List get favstatistics => _favstatistics;

  set favstatistics(List value) {
    _favstatistics = value;
    update();
  }

  List<FavModel> get favlist => _favlist;

  set favlist(List<FavModel> value) {
    _favlist = value;
    update();
  }

  getfavs()async{
    DatabaseHelper _databaseHelper;
    List<FavModel> list = [];
    List favstatisticslist = [];
    List rocklist = [];
    List metallist = [];
    List turkishlist = [];
    List raplist = [];
    _databaseHelper = DatabaseHelper();
    var data = await _databaseHelper.getFav();
    for (Map<String,dynamic> okunanmap in data!) {
      list.add(FavModel.fromMap(okunanmap));
    }
    for(var value in list){
      if(value.type == "Rock"){
        rocklist.add(value.type);
      }else if(value.type == "Metal"){
        metallist.add(value.type);
      }else if(value.type == "Türkçe Pop"){
        turkishlist.add(value.type);
      }else{
        raplist.add(value.type);
      }
    }
    favstatisticslist = [rocklist,metallist,turkishlist,raplist];
    _favstatistics = favstatisticslist;
    favlist = list;
  }
}