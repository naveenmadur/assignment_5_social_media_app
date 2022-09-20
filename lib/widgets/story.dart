import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story({Key? key, required this.name, required this.imageUrl}) : super(key: key);
  final String name, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.only(bottom: 22, left: 8),
      // padding: const EdgeInsets.only(bottom: 16,left: 8, right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
           CircleAvatar(
            radius: 40,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 38,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 34,
              ),
            ),
          ),
           Text(name, style: const TextStyle(fontSize: 15), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
