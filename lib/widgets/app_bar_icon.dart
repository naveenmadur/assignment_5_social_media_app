import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    Key? key, required this.icon
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
          radius: 30,
          backgroundColor:  const Color.fromRGBO(230, 238, 250, 1),
          child: Icon(
            icon,
            color: Colors.black,
          )),
    );
  }
}
