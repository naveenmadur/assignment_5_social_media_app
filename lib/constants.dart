import 'package:flutter/material.dart';

//Home Screen

const progreeIndicator = Center(
  child: CircularProgressIndicator(),
);

//MyHomePage
const Color scaffoldBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const Color bottomNavBarColor = Color.fromRGBO(87, 144, 223, 0.6);
const Color bottomNavBarButtonColor = Color.fromRGBO(246, 221, 210, 0.6);
const Color bottomNavBarBackColor = Colors.transparent;

//AppBar
const EdgeInsetsGeometry appBarMargin =
    EdgeInsets.symmetric(horizontal: 10, vertical: 10);

const EdgeInsetsGeometry appBarPadding = EdgeInsets.only(top: 21);

const TextStyle appBarTextStyle =
    TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600);

const Color appBarBackgroundColor = Colors.white;

//AppBar Icon
const EdgeInsetsGeometry appBarIconPadding = EdgeInsets.all(8.0);
const double appBarCircleAvatarRadius = 30;
const Color appBarCircleAvatarColor = Color.fromRGBO(230, 238, 250, 1);

//Post
Decoration postContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(40.30),
  color: const Color.fromRGBO(230, 238, 250, 1),
);

const EdgeInsetsGeometry postContainerMargin =
    EdgeInsets.only(left: 10.9, right: 10.9, bottom: 20.9);

const EdgeInsetsGeometry postContainerPadding = EdgeInsets.all(10.9);

const Decoration postActionButtonDecoration = BoxDecoration(
  color: Color.fromRGBO(0, 0, 0, 0.3),
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(30.28),
    bottomRight: Radius.circular(30.28),
  ),
);

const EdgeInsetsGeometry postActionButtonPadding =  EdgeInsets.symmetric(horizontal: 15);

const TextStyle postActionButtonTextStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
