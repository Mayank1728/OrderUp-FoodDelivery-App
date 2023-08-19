import 'package:app/controllers/recommended_product_controller.dart';
import 'package:app/routes/route_helper.dart';
import 'package:app/utils/app_constants.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/app_icon.dart';
import 'package:app/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var productDetails =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      iconData: Icons.close,
                      iconSize: 50,
                    )),
                AppIcon(iconData: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height50),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius15),
                        topRight: Radius.circular(Dimensions.radius15))),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimensions.height5, bottom: Dimensions.height5),
                child: Center(
                  child: BigText(
                      text: productDetails.name, size: Dimensions.font30),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            collapsedHeight: 200,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL +
                    AppConstants.UPLOAD_URL +
                    productDetails.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height30,
                    bottom: Dimensions.height30),
                child: Row(children: [
                  ExpandableTextWidget(text: productDetails.description)
                ]),
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: Container(
        // padding: EdgeInsets.only(bottom: Dimensions.height50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width30,
                  right: Dimensions.width30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    iconData: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                  BigText(
                    text: "\$${productDetails.price} " + "X" + " 0",
                    size: 27,
                  ),
                  AppIcon(
                    iconData: Icons.add,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height15,
                  left: Dimensions.width30,
                  right: Dimensions.width30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius15),
                      topRight: Radius.circular(Dimensions.radius15)),
                  color: Colors.grey.shade300),
              child: Row(
                // can fix the button sizes
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 75,
                    width: 60,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15)),
                    child: AppIcon(
                      iconData: Icons.favorite,
                      iconColor: AppColors.mainColor,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    height: 75,
                    width: 185,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(
                          text: "\$${productDetails.price} | Add to Cart",
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
