import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/post_data.dart';

class UserPosts extends ChangeNotifier {
  List<PostData> postList = [];
  List<PostData> bookmarkedPost = [];
  List<bool> flag = [];
  Future<void> fetchPostData() async {
    final url = Uri.parse('https://dummyapi.io/data/v1/post?limit=10');
    final response =
        await http.get(url, headers: {'app-id': '6327ee4dd0138c6b8fcf2f8e'});
    final data = jsonDecode(response.body)['data'] as List;
    final List<PostData> posts = [];
    for (var item in data) {
      posts.add(PostData.fromJson(item));
      flag.add(false);
    }
    notifyListeners();
    postList = posts;
    // print(posts[0].owner!.firstName);
  }

  void addBookmarks(String id){
    final post = postList.firstWhere((element) => element.id == id);
    // bookmarkedPost.indexWhere((element) => element.id == id);
    bookmarkedPost.add(post);
    notifyListeners();
  }

  void toggleBookmark(int index){
    flag[index] = !flag[index];
    notifyListeners();
  }
}