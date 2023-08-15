import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class IconAndWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final double size;

  const IconAndWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor,
      this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: Dimensions.widthBtwIconAndText,),
        SmallText(text: text, size: size,)
      ],
    );
  }
}
