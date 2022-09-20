import 'package:flutter/material.dart';
import 'package:social_media_app/constants.dart';
import 'package:social_media_app/widgets/custom_app_bar.dart';
import '../screens/home_screen.dart';
import '../widgets/custom_app_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;
  bool _showBookmarks = false;
  void _onItemTapped(int index) {
    setState(() {
      if(index == 4){
        _showBookmarks = true;
      }
      else{
        _showBookmarks = false;
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height / 12,
          backgroundColor: appBarBackgroundColor,
          elevation: 0,
          flexibleSpace: const CustomAppBar(),
        ),
        body:  HomeScreen(showBookmarks: _showBookmarks,),
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          onTap: _onItemTapped,
          color: bottomNavBarColor,
          buttonBackgroundColor: bottomNavBarButtonColor ,
          backgroundColor: bottomNavBarBackColor,
          items: const [
            Icon(Icons.home, size: 35),
            Icon(Icons.comment, size: 35),
            Icon(Icons.add, size: 35),
            Icon(Icons.person_rounded, size: 35),
            Icon(Icons.bookmark_border_rounded, size: 35),
          ],
        ));
  }
}
