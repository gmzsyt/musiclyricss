class ArtistModel {
  int? id;
  String? birthday;
  String? photo;
  String? firstSong;
  bool? isGroup;
  List? members;
  String? place;
  String? musicType;

  ArtistModel.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.birthday = map["birthday"];
    this.photo = map["photo"];
    this.musicType = map["musicType"];
    this.firstSong = map["firstSong"];
    this.isGroup = map["isGroup"];
    this.members = map["members"];
    this.place = map["place"];
  }
}
