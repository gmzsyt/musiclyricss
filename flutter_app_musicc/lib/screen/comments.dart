import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/model/commentModel.dart';
import 'package:flutter_app_musicc/screen/tocomment.dart';

import 'package:flutter_app_musicc/utils/firestore.dart';
import 'package:get/get.dart';

import '../utils/firestore.dart';

class Comment extends StatefulWidget {
  final String song;

  Comment(this.song);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FireStoreDB().readComment(widget.song),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Bir şeyler yanlış gitti');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                List<CommentModel> comments = [];
                for(var data in snapshot.data!.docs){
                  Map<String, dynamic> map = data.data() as Map<String, dynamic>;
                  comments.add(CommentModel.fromMap(map));
                }
                return Flexible(
                  child: comments.length < 1 ? Center(child: Text("Henüz yorum yok"),) : ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: ListTile(
                              leading: Image.asset(
                                "images/icon.png",
                                width: 40,
                              ),
                              trailing: Icon(
                                Icons.comment_rounded,
                                size: 30,
                              ),
                              title: Text(comments[index].commenter!),
                              subtitle: Text(comments[index].comment!),
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => ToComment(widget.song));
                },
                child: Text("Yorum Yap"),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
