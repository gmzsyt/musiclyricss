import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/model/commentModel.dart';
import 'package:get/get.dart';

import '../utils/firestore.dart';

class ToComment extends StatefulWidget {
  String song;

  ToComment(this.song);

  @override
  _ToCommentState createState() => _ToCommentState();
}

class _ToCommentState extends State<ToComment> {
  var whomcontroller = TextEditingController();
  var commentcontroller = TextEditingController();
  String? whomerror,commenterror;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
        child: Column(
          children: [
            TextField(
              controller: whomcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Kimden ?",
                errorText: whomerror
              ),
              onChanged: (data){
                setState(() {
                  whomerror = null;
                });
              },
            ),
            SizedBox(height: 30,),
            Container(
              height: 5 * 24.0,
              child: TextField(
                controller: commentcontroller,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Yorumunuz",
                  errorText: commenterror
                ),
                onChanged: (data){
                  setState(() {
                    commenterror = null;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: ElevatedButton(
                onPressed: () => comment(whomcontroller.text, commentcontroller.text),
                child: Text("Yorum Yap"),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  comment(String whom,String comment) async{
    if(whom == ""){
      setState(() {
        whomerror = "Bir isim girin";
        print(whom);
      });
    }else if(comment == ""){
      setState(() {
        commenterror = "Bir yorum girin";
        print(comment);
      });
    }else{
      CommentModel cmnt = CommentModel(comment, whom);
      int returned = await FireStoreDB().writeComment(cmnt,widget.song);
      if(returned == 1){
        whomcontroller.text = "";
        commentcontroller.text = "";
        Get.snackbar("Harika!", "Yorumunuz başarıyla alındı");
      }else{
        Get.snackbar("Ops!", "Bir şeyler yanlış gitti");
      }

    }
  }
}
