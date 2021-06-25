class CommentModel {
  int? id;
  String? comment;
  String? commenter;

  CommentModel(this.comment, this.commenter);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["comment"] = comment;
    map["commenter"] = commenter;
    return map;
  }

  CommentModel.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.comment = map["comment"];
    this.commenter = map["commenter"];
  }
}
