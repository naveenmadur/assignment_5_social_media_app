import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/owner.dart';
import 'dart:convert';

class OwnerData extends ChangeNotifier{

  List<Owner> ownerList = [];
  Future<void> fetchOwnerData() async {
    final url = Uri.parse('https://dummyapi.io/data/v1/post?limit=10');
    final response =
        await http.get(url, headers: {'app-id': '6327ee4dd0138c6b8fcf2f8e'});
    final data = jsonDecode(response.body)['data'] as List;
    final List<Owner> owner = [];
    for (var item in data) {
      owner.add(Owner.fromJson(item['owner']));
    }
    ownerList = owner;
  }
}