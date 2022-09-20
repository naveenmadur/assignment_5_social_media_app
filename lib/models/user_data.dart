import 'package:social_media_app/models/post_data.dart';

class UserData {
  List<PostData>? data;
  UserData({this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PostData>[];
      json['data'].forEach((v) {
        data!.add( PostData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



