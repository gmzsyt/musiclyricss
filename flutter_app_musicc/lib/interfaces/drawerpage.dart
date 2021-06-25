import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/interfaces/HomePage.dart';
import 'package:flutter_app_musicc/screen/favorite.dart';
import 'package:flutter_app_musicc/screen/hakkinda.dart';
import 'package:flutter_app_musicc/utils/chart.dart';
import 'package:flutter_app_musicc/utils/getState.dart';
import 'package:get/get.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
GetState getState = Get.put(GetState());
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(),
        body: GetBuilder<GetState>(
            init: GetState(),
            builder:(_){
              return pages(_.drawerindex);
            })
    );
  }

  Widget pages(int index){
    switch(index){
      case 0:
        return Home();
        break;
      case 1:
        return FavoritePages();
        break;
      case 2:
        return Chart();
        break;
        case 3:
        return Hakkinda();
        break;
    }
    return Container();
  }
}
