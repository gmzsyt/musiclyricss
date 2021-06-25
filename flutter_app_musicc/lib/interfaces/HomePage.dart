import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/screen/music_type.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _controller = VideoPlayerController.asset("assets/anasayfaWeb.mp4")
        ..initialize().then((_) {
          setState(() {
            _controller!.play();
            _controller!.setLooping(true);
          });
        });
    } else {
      _controller = VideoPlayerController.asset("assets/anasayfa.mp4")
        ..initialize().then((_) {
          setState(() {
            _controller!.play();
            _controller!.setLooping(true);
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff20232d),
        appBar: AppBar(
          title: new Text("Music Lyrics"),
          backgroundColor: Colors.black,
        ),
        drawer: DrawerPage(),
        body: Stack(
          children: [
            Positioned.fill(
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : Container(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 80.0, left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => MusicType());
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Keşfetmeye Başla",
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                        ),
                      ],
                    ),
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.black12,
                            blurRadius: 5,
                          ),
                        ],
                        gradient: LinearGradient(
                            colors: [Color(0xfff05454), Color(0xff30475e)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight)),
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
