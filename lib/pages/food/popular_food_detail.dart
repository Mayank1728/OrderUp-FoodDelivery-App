import 'package:app/controllers/popular_product_controller.dart';
import 'package:app/routes/route_helper.dart';
import 'package:app/utils/app_constants.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/app_icon.dart';
import 'package:app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/app_column.dart';
import '../cart/cart_page.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId; // contains index of which popularProduct to display
  final String page; // stores loc of where u came from
  PopularFoodDetails({super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    // initialize this product inside the cartController class
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.BASE_URL +
                          AppConstants.UPLOAD_URL +
                          product.img))),
            ),
          ),
          // back and shopping cart btn
          Positioned(
            top: Dimensions.height80,
            left: Dimensions.width30,
            right: Dimensions.width30,
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      if(page == "cartpage")
                        Get.toNamed(RouteHelper.getCartPage());
                      else
                        Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(iconData: Icons.arrow_back_ios)),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: (){
                      if(controller.totalItems > 0)
                        Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(iconData: Icons.shopping_cart_outlined),
                        controller.totalItems >= 1 ?
                            //AppIcon(iconData: Icons.circle, iconSize: 20,iconColor: Colors.transparent, backgroundColor: AppColors.mainColor,):
                            Positioned(right: 0, top: 0, child: Icon(Icons.circle, size:23, color: AppColors.mainColor,)):
                            Container(),
                        controller.totalItems >= 1 ?
                        //AppIcon(iconData: Icons.circle, iconSize: 20,iconColor: Colors.transparent, backgroundColor: AppColors.mainColor,):
                        Positioned(right: 7, top: 3, child: BigText(text: "${controller.totalItems}", size: 12.5, color: Colors.white,)):
                        Container(),
                      ],
                    ),
                  );
                }),
              ],
            )),
          ),
          // Food Details
          // remember my AppColumn widget has
          // 2 properties text and para
          Positioned(
            top: Dimensions.popularFoodImgSize - 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: AppColumn(
              text: product.name,
              para: product.description,
            ),
          ),
        ],
      ),
      // Navigation bar
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          height: Dimensions.bottomHeightBar - 15,
          padding: EdgeInsets.only(
              top: Dimensions.height15,
              bottom: Dimensions.height15,
              left: Dimensions.width30,
              right: Dimensions.width30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius15),
                  topRight: Radius.circular(Dimensions.radius15)),
              color: AppColors.signColor),
          child: Row(
            // can fix the button sizes
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 75,
                width: 125,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: AppColors.signColor)),
                    BigText(text: "${popularProduct.inCartItems}"),
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 75,
                width: 165,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        popularProduct.addItem(product);
                      },
                      child: BigText(
                        text: "\$${product.price} Add to Cart",
                        size: 19,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
