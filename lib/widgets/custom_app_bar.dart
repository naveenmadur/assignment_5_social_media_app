import 'package:flutter/material.dart';
import '../widgets/app_bar_icon.dart';
import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: appBarMargin,
      padding: appBarPadding,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            AppBarIcon(
              icon: Icons.camera_enhance,
            ),
            Text(
              'Explore',
              style: appBarTextStyle,
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
