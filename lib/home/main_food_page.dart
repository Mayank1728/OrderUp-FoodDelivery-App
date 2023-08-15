import 'package:app/home/food_page_body.dart';
import 'package:app/utils/colors.dart';
import 'package:app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/big_text.dart';

import '../utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: Dimensions.height20,),
        // Header contains Karnataka, Banglore and Search icon
        Container(
            margin: EdgeInsets.only(
                top: Dimensions.height50, bottom: Dimensions.height10),
            padding: EdgeInsets.only(
                left: Dimensions.width30, right: Dimensions.width30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  BigText(text: "Karnataka", color: AppColors.mainColor),
                  Row(
                    children: [
                      SmallText(
                        text: "Banglore",
                        color: Colors.black,
                        size: Dimensions.width30,
                      ),
                      Icon(Icons.arrow_drop_down_rounded),
                    ],
                  )
                ]),
                Center(
                    child: Container(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.blue),
                )),
              ],
            )),
        // floating cardlike widget
        Expanded(
            child: SingleChildScrollView(
          child: FoodPageBody(),
        )),
      ],
    ));
  }
}
