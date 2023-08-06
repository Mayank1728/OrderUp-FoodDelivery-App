import 'package:app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;


  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.pageViewTextContainer,
      padding: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, top: Dimensions.height10),
      margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height50),
      // change to 15 both, rem top
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xFFe8e8e8),
                blurRadius: 5.0,
                offset: Offset(0,5)
            )
          ]

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: "Bitter Orange Marinade",
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                        (index) => Icon(Icons.star,
                        color: AppColors.mainColor, size: 15)),
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
            height: Dimensions.height10,
          ),
          Row(
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
          )
        ],
      ),

    );
  }
}
