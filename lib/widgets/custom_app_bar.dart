import 'package:flutter/material.dart';
import '../widgets/app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      padding: const EdgeInsets.only(top: 21),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            AppBarIcon(
              icon: Icons.camera_enhance,
            ),
            Text(
              'Explore',
              style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),
            ),
            AppBarIcon(
              icon: Icons.notifications_on_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
