import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/interfaces/drawer.dart';
import 'package:flutter_app_musicc/utils/getState.dart';
import 'package:get/get.dart';
import 'package:flutter_app_musicc/utils/databese_helper.dart';

class FavoritePages extends StatefulWidget {
  @override
  _FavoritePagesState createState() => _FavoritePagesState();
}

class _FavoritePagesState extends State<FavoritePages> {
  GetState getFavorite = Get.put(GetState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Favoriler"),
        backgroundColor: Colors.black,
      ),
      drawer: DrawerPage(),
      body: Container(
        child: ListView.builder(
            itemCount: getFavorite.favlist.length,
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
                title: Text(getFavorite.favlist[index].favsong!),
                trailing: IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () {
                    Get.defaultDialog(
                        title: "FAVORİLERDEN KALDIR",
                        content: Text("${getFavorite.favlist[index].favsong} şarkısını favorilerden kaldırmak istediğinize emin misiniz ?"),
                        actions: [
                          TextButton(onPressed: (){
                            Get.back();
                          }, child: Text("İptal")),
                          TextButton(onPressed: (){
                            DatabaseHelper databasehelper = DatabaseHelper();
                            setState(() {
                              databasehelper.deleteFav(getFavorite.favlist[index].favsong!);
                              getFavorite.favlist.removeAt(index);
                              Get.back();
                              Get.snackbar("Başarılı", "Favori kaldırıldı");
                            });
                          }, child: Text("Tamam"))
                        ]
                    );
                  },
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
