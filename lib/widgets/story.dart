import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story({Key? key, required this.name, required this.imageUrl}) : super(key: key);
  final String name, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
           CircleAvatar(
            radius: 40,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 38,
            ),
          ),
           Text(name, style: const TextStyle(fontSize: 15), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
