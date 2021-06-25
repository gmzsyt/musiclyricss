class FavModel {
  int? id;
  String? favsong;
  String? type;

  FavModel(this.favsong, this.type);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["favsong"] = favsong;
    map["type"] = type;

    return map;
  }

  FavModel.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.favsong = map["favsong"];
    this.type = map["type"];
  }
}
