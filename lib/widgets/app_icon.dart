import 'package:app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;

  const AppIcon(
      {super.key,
      required this.iconData,
      this.iconColor = const Color(0xFF756d54),
      this.backgroundColor = const Color(0xFFfcf4ef),
      this.iconSize = 50
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize,
      height: Dimensions.iconSize50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(iconSize/2),
        color: backgroundColor
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: 23
        )
    );
  }
}
