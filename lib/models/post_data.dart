import 'owner.dart';

class PostData {
  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text;
  String? publishDate;
  Owner? owner;
  bool isBookmarked = false;

  PostData(
      {this.id,
      this.image,
      this.likes,
      this.tags,
      this.text,
      this.publishDate,
      this.owner,
      required this.isBookmarked});

  PostData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    likes = json['likes'];
    tags = json['tags'].cast<String>();
    text = json['text'];
    publishDate = json['publishDate'];
    owner = json['owner'] != null ?  Owner.fromJson(json['owner']) : null;
    isBookmarked;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['likes'] = likes;
    data['tags'] = tags;
    data['text'] = text;
    data['publishDate'] = publishDate;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    return data;
  }
}