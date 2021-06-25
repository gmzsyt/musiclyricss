import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_musicc/model/favmodel.dart';
import 'package:flutter_app_musicc/screen/aboutartist.dart';
import 'package:flutter_app_musicc/screen/comments.dart';
import 'package:flutter_app_musicc/utils/databese_helper.dart';
import 'package:flutter_app_musicc/utils/getState.dart';
import 'package:flutter_app_musicc/utils/getlyrics.dart';
import 'package:get/get.dart';

class Lyrics extends StatefulWidget {
  String name;
  String photo;
  String lyrics;
  String type;

  Lyrics(this.name, this.photo, this.lyrics, this.type);

  @override
  _LyricsState createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  bool isFav = false;
  int favsongindex = 0;
  double photoheight = 150;
  double photowidth = 150;
  double fontsize = 16;
  GetState getFavorite = Get.put(GetState());

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < getFavorite.favlist.length; i++) {
      if (getFavorite.favlist[i].favsong == widget.name) {
        print("İSİM EŞİT");
        isFav = true;
        favsongindex = i;
      } else {
        print("İSİM EŞİT DEĞİL");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        title: new Text(widget.name + " Lyrics"),
        backgroundColor: Colors.black,
        actions: [
          new IconButton(
              icon: isFav
                  ? new Icon(Icons.favorite)
                  : new Icon(Icons.favorite_border),
              onPressed: () {
                DatabaseHelper databaseHelper = DatabaseHelper();
                if (isFav) {
                  setState(() {
                    databaseHelper.deleteFav(widget.name);
                    getFavorite.favlist.removeAt(favsongindex);
                    isFav = false;
                    getFavorite.getfavs();
                  });
                } else {
                  setState(() {
                    databaseHelper.addFav(FavModel(widget.name, widget.type));
                    getFavorite.favlist.add(FavModel(widget.name, widget.type));
                    isFav = true;
                    getFavorite.getfavs();
                  });
                }
              }),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                      future: GetLyrics().getlyrics(widget.lyrics),
                      builder: (context, snap) {
                        if (snap.hasData) {
                          var data = snap.data;
                          return Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                widget.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    photoheight = 250;
                                    photowidth = 250;
                                  });
                                },
                                onLongPressEnd: (e) {
                                  setState(() {
                                    photoheight = 150;
                                    photowidth = 150;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(widget.photo,
                                      height: photoheight,
                                      width: photowidth,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onDoubleTap: () {
                                  Clipboard.setData(
                                      new ClipboardData(text: data.toString()));
                                  Get.snackbar(
                                      "Kopyalandı", "Metin kopyalandı");
                                },
                                child: Text(
                                  data.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: fontsize),
                                ),
                                onHorizontalDragUpdate:
                                    (DragUpdateDetails details) {
                                  if (details.delta.dx.isLowerThan(-10)) {
                                    setState(() {
                                      fontsize--;
                                    });
                                  } else if (details.delta.dx
                                      .isGreaterThan(10)) {
                                    setState(() {
                                      fontsize++;
                                    });
                                  }
                                },
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            List name = widget.name.split(" - ");
                            Get.to(() => AboutArtist(name[1]));
                          },
                          child: Text("Sanatçı hakkında")),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            List name = widget.name.split(" - ");
                            Get.to(() => Comment(name[0]));
                          },
                          child: Text("Yorumlar")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
