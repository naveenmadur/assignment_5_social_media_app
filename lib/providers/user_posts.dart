import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/post_data.dart';

class UserPosts extends ChangeNotifier {
  List<PostData> postList = [];
  List<PostData> _bookmarkedPost = [];

  Future<void> fetchPostData() async {
    final url = Uri.parse('https://dummyapi.io/data/v1/post?limit=10');
    try {
      final response =
          await http.get(url, headers: {'app-id': '6327ee4dd0138c6b8fcf2f8e'});
      final data = jsonDecode(response.body)['data'] as List;
      for (var item in data) {
        postList.add(PostData.fromJson(item));
      }
    } catch (error) {
      print(error);
    } 
  }

  void toogleBookmarks(PostData postData) {
    if (postData.isBookmarked == true) {
      postData.isBookmarked = false;
      _bookmarkedPost.add(postData);
    } else {
      postData.isBookmarked = true;
      _bookmarkedPost.remove(postData);
    }
    notifyListeners();
  }

  List<PostData> bookmark() {
    _bookmarkedPost =
        postList.where((element) => element.isBookmarked == true).toList();
    return [..._bookmarkedPost];
  }

}
