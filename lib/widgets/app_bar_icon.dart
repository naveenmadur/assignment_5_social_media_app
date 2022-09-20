import 'package:flutter/material.dart';
import 'package:social_media_app/constants.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    Key? key, required this.icon
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appBarIconPadding,
      child: CircleAvatar(
          radius: appBarCircleAvatarRadius,
          backgroundColor:  appBarCircleAvatarColor,
          child: Icon(
            icon,
            color: Colors.black,
          )),
    );
  }
}
