import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/utils/getState.dart';
import 'package:get/get.dart';

class DrawerPage extends StatelessWidget {
  GetState getState = Get.put(GetState());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        color: Colors.black,
        child: Drawer(
          child: Container(
            color: Colors.black,
            child: new ListView(
              children: [
                new UserAccountsDrawerHeader(
                    accountName: Text(
                      "Gamznur Seyit",
                      style: TextStyle(color: Colors.white),
                    ),
                    accountEmail: Text(
                      "gmzzsuyyt@gmail.com",
                      style: TextStyle(color: Colors.white),
                    )),
                DecoratedBox(
                    decoration: BoxDecoration(
                  color: Colors.red,
                )),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      getState.drawerindex = 0;
                    },
                    child: Text(
                      "Anasayfa",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      getState.drawerindex = 1;
                    },
                    child: Text(
                      "Favoriler",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: Icon(
                    Icons.star,
                    color: Colors.redAccent,
                  ),
                ),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      getState.drawerindex = 2;
                    },
                    child: Text(
                      "İstatistik",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: Icon(
                    Icons.bar_chart,
                    color: Colors.blueGrey,
                  ),
                ),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      getState.drawerindex = 3;
                    },
                    child: Text(
                      "Hakkında",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  leading: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Kapat",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
