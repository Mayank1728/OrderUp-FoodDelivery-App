import 'package:app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/expandable_text_widget.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final String para;

  const AppColumn({
    super.key,
    required this.text,
    this.para = "This is a Default sentence. Pass the para to the AppColumn function"
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.pageViewTextContainer,
      padding: EdgeInsets.only(
          left: Dimensions.width30,
          right: Dimensions.width30,
          top: Dimensions.height10),
      // change to 15 both, rem top
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius15),
            topRight: Radius.circular(Dimensions.radius15)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: text,
            size: Dimensions.font30,
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                    (index) =>
                        Icon(Icons.star, color: AppColors.mainColor, size: 15)),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "4.5"),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "1337"),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "comments")
            ],
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndWidget(
                  icon: Icons.circle_sharp,
                  text: "Normal",
                  iconColor: AppColors.iconColor1),
              SizedBox(
                width: Dimensions.width20,
              ),
              IconAndWidget(
                  icon: Icons.location_on,
                  text: "1.5km",
                  iconColor: AppColors.mainColor),
              SizedBox(
                width: Dimensions.width20,
              ),
              IconAndWidget(
                  icon: Icons.access_time_rounded,
                  text: "32mins",
                  iconColor: AppColors.iconColor2)
            ],
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          BigText(text: "Introduce"),
          SizedBox(
            height: Dimensions.height15,
          ),
          // Text contents for the details section
          ExpandableTextWidget(
              text: para)
        ],
      ),
    );
  }
}
