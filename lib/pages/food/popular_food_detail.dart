import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_column.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Food Poster
          Positioned(
            left: 0, right: 0,
            child: Container(
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage("assets/image/food1.png")
                )
              ),
          ),),
          // back and cart button
          Positioned(
            top: Dimensions.height80,
            left: Dimensions.width30,
            right: Dimensions.width30,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(iconData: Icons.arrow_back_ios),
                  AppIcon(iconData: Icons.shopping_cart_outlined)
                ],
              )
            ),
          ),
          Positioned(
            top: Dimensions.popularFoodImgSize - 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: AppColumn(text: "Hello"),
          )

        ],
      )
    );
  }
}
