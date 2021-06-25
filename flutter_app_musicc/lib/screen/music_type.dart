import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/utils/lyricsApi.dart';

import 'sing.dart';

class MusicType extends StatefulWidget {
  @override
  _MusicTypeState createState() => _MusicTypeState();
}

class _MusicTypeState extends State<MusicType> {
  List cats = [];

  @override
  void initState() {
    super.initState();
   LyricsApi().lyricsApi().then((value){
     setState(() {
       cats = value;
     });
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Şarkı Türleri"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Color(0x0ff20232d),
          child: ListView.builder(
              itemCount: cats.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Sing(cats[index]["sings"],cats[index]["Tür"])));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(width: 50,),
                          Expanded(
                            child: Text(
                              cats[index]["Tür"],style: TextStyle(color: Colors.black,fontSize: 16),
                            ),
                          ),
                          Expanded(child: Icon(Icons.music_video,size: 32,)),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.black12,
                              blurRadius: 3,
                            ),
                          ],
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white, Colors.grey],
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight)),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                );
              }),
        )
        );
  }
}
