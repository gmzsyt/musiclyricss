import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/utils/firestore.dart';
import 'package:flutter_app_musicc/model/artistModel.dart';

import '../model/artistModel.dart';

class AboutArtist extends StatefulWidget {
  final String artist;

  AboutArtist(this.artist);

  @override
  _AboutArtistState createState() => _AboutArtistState();
}

class _AboutArtistState extends State<AboutArtist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.artist,
          style: TextStyle(fontSize: 24),
        ),
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: FireStoreDB().readArtist(widget.artist),
          builder: (context, snap) {
            if (snap.hasData) {
              ArtistModel artist = snap.data as ArtistModel;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(image: NetworkImage(artist.photo!), fit: BoxFit.fill),
                      ),
                      height: 350,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: artist.isGroup!
                          ? Text(
                              "Grup Kuruluş Tarihi: ${artist.birthday}",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          : Text("Doğum Tarihi: ${artist.birthday}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "Müzik Türü: ${artist.musicType}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Yaşadığı Yer: ${artist.place}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Üyeler",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          thickness: 3,
                          height: 3,
                        ),
                        ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            // itemExtent: 30,
                            itemCount: artist.members!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  artist.members![index].toString(),
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }),
                        Divider(
                          thickness: 3,
                          height: 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 30),
                      child: Text(
                        "İlk Şarkı: ${artist.firstSong}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
