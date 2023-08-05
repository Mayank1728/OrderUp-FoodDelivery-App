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
    print("current height: ${MediaQuery.of(context).size.height.toString()}");
    return Scaffold(
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top:Dimensions.height50, bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        BigText(text: "Haryana",color: AppColors.mainColor, size: Dimensions.radius30, ),
                        Row(
                          children: [
                            SmallText(text: "GGN", color: Colors.black,),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        )
                      ]),
                      Center(
                        child: Container(
                          width: 45,
                          height: 45,
                          child: Icon(Icons.search, color: Colors.white,),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius15),
                              color: Colors.blue),
                        )
                      )
                ],
                )
            ),
            Expanded(child: SingleChildScrollView(
              child: FoodPageBody(),
            )),
        ],
    )
    );
  }
}
