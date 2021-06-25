import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_musicc/model/artistModel.dart';
import 'package:flutter_app_musicc/model/commentModel.dart';

class FireStoreDB {
  CollectionReference artists = FirebaseFirestore.instance.collection('artists');
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<ArtistModel> readArtist(String artistName) async {
    DocumentSnapshot documentSnapshot = await artists.doc(artistName).get();
    Map<String, dynamic> map = documentSnapshot.data() as Map<String, dynamic>;
    ArtistModel artist = ArtistModel.fromMap(map);
    return artist;
  }

  Stream<QuerySnapshot> readComment(String songName){
    Stream<QuerySnapshot> comments = FirebaseFirestore.instance.collectionGroup(songName).snapshots();
    return comments;
  }

  Future<int> writeComment(CommentModel comment,String song) async{
    try{
      await firestore.collection("comments").doc(song).collection(song).add(comment.toMap());
      return 1;
    }catch (e){
      return 2;
    }
  }
}
