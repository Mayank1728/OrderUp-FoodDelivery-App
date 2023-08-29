import 'package:app/controllers/cart_controller.dart';
import 'package:app/controllers/recommended_product_controller.dart';
import 'package:app/pages/cart/cart_page.dart';
import 'package:app/routes/route_helper.dart';
import 'package:app/utils/app_constants.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/app_icon.dart';
import 'package:app/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var productDetails =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(productDetails, Get.find<CartController>());
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
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.to(() => CartPage());
                        },
                          child: AppIcon(iconData: Icons.shopping_cart_outlined)),
                      controller.totalItems >= 1 ?
                      //AppIcon(iconData: Icons.circle, iconSize: 20,iconColor: Colors.transparent, backgroundColor: AppColors.mainColor,):
                      Positioned(right: 0, top: 0, child: Icon(Icons.circle, size:23, color: AppColors.mainColor,)):
                      Container(),
                      controller.totalItems >= 1 ?
                      //AppIcon(iconData: Icons.circle, iconSize: 20,iconColor: Colors.transparent, backgroundColor: AppColors.mainColor,):
                      Positioned(right: 7, top: 3, child: BigText(text: "${controller.totalItems}", size: 12.5, color: Colors.white,)):
                      Container(),
                    ],
                  );
                }),
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
        // as popular product controller and rec product controller
        // have the same methods so using methods from pop prdt controller
        child: GetBuilder<PopularProductController>(builder: (controller){
          // productDetails model
          return Column(
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
                    GestureDetector(
                      onTap: (){
                        // print("working");
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        iconData: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                    BigText(
                      text: "\$${productDetails.price} X ${controller.inCartItems}",
                      size: 27,
                    ),
                    GestureDetector(
                      onTap: (){
                        // print("working");
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconData: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
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
                    GestureDetector(
                      onTap: (){
                        controller.addItem(productDetails);
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              )
            ],
          );
        },),
      ),
    );
  }
}
