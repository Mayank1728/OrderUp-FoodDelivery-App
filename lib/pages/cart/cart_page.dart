import 'package:app/base/no_data_page.dart';
import 'package:app/controllers/popular_product_controller.dart';
import 'package:app/controllers/recommended_product_controller.dart';
import 'package:app/utils/app_constants.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/big_text.dart';
import 'package:app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height50 * 1.5,
              left: Dimensions.width30,
              right: Dimensions.width30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      iconData: Icons.arrow_back_ios_new_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width30 * 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      iconData: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  AppIcon(
                    iconData: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  )
                ],
              )),
          GetBuilder<CartController>(builder: (_cartController){
            if(_cartController.getItems.length == 0){
              return const NoDataPage(text: "Your Cart is Empty!");
            } else{
              return Positioned(
                  top: Dimensions.height20 * 6,
                  left: Dimensions.height15,
                  right: Dimensions.height15,
                  bottom: 0,
                  child: Container(
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    //color: AppColors.mainColor,
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child:
                        GetBuilder<CartController>(builder: (cartController) {
                          var _cartList = cartController.getItems;
                          return ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: double.maxFinite,
                                  height: 100,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          int popularIdx =
                                          Get.find<PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                              _cartList[index].product);
                                          if (popularIdx >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getPopularFoodPage(
                                                    popularIdx, "cartpage"));
                                          } else {
                                            int recommendedIdx = Get.find<
                                                RecommendedProductController>()
                                                .recommendedProductList
                                                .indexOf(_cartList[index].product);
                                            if(recommendedIdx < 0){
                                              Get.snackbar("History Product", "Review Not available for History products",
                                                  backgroundColor: AppColors.mainColor, colorText: Colors.white);
                                            } else{
                                              Get.toNamed(
                                                  RouteHelper.getRecommendedFood(
                                                      recommendedIdx, "cartpage"));
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              //color: Colors.green,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      AppConstants.BASE_URL +
                                                          AppConstants.UPLOAD_URL +
                                                          cartController
                                                              .getItems[index]
                                                              .img!))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width20,
                                      ),
                                      Expanded(
                                        child: Container(
                                          //color: Colors.black,
                                          margin: EdgeInsets.symmetric(vertical: 7),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              BigText(
                                                text:
                                                "${cartController.getItems[index].name!}",
                                              ),
                                              SmallText(
                                                text: "Spicy",
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  BigText(
                                                    text:
                                                    "${cartController.getItems[index]!.price}",
                                                    color: AppColors.mainColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    height: Dimensions.height50,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius15)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                      children: [
                                                        GestureDetector(
                                                          // remove button
                                                            onTap: () {
                                                              //popularProduct.setQuantity(false);
                                                              cartController
                                                                  .addItem(
                                                                  _cartList[
                                                                  index]
                                                                      .product!,
                                                                  -1);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signColor,
                                                              size: Dimensions
                                                                  .width50,
                                                            )),
                                                        BigText(
                                                            text:
                                                            "${_cartList[index].quantity}",),
                                                        // ${popularProduct.inCartItems}
                                                        GestureDetector(
                                                          // add button
                                                          onTap: () {
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                1);
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color:
                                                            AppColors.signColor,
                                                            size:
                                                            Dimensions.width50,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        })),
                  ));
            }
          })
        ],
      ),
      // changes made at
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
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
                    color: cartController.getItems.length == 0 ? Colors.grey[50]: Colors.grey[100]),
                child:cartController.getItems.length == 0? Container() : Row(
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
                          BigText(text: "\$${cartController.totalAmount}"),
                        ],
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 125,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //popularProduct.addItem(product)
                              cartController.addToHistory();
                            },
                            child: BigText(
                              text: "Check Out",
                              size: 19,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
            );
      }),
    );
  }
}
