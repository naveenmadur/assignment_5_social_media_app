import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/owner.dart';
import 'dart:convert';

class OwnerData extends ChangeNotifier {
  List<Owner> ownerList = [Owner(id:'1', title: 'You', firstName: 'You', picture: 'https://cdn-icons-png.flaticon.com/512/1057/1057061.png')];
  Future<void> fetchOwnerData() async {
    try {
      final url = Uri.parse('https://dummyapi.io/data/v1/post?limit=10');
      final response =
          await http.get(url, headers: {'app-id': '6327ee4dd0138c6b8fcf2f8e'});
      final data = jsonDecode(response.body)['data'] as List;
      for (var item in data) {
        ownerList.add(Owner.fromJson(item['owner']));
      }
    } catch (error) {
      print(error);
    } 
  }
}
