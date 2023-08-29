import 'package:app/home/main_food_page.dart';
import 'package:app/utils/app_constants.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/big_text.dart';
import 'package:app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
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
                  AppIcon(iconData: Icons.arrow_back_ios_new_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,),
                  SizedBox(width: Dimensions.width30 * 2,),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIcon(iconData: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,),
                  ),
                  AppIcon(iconData: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,)
                ],
              )),
          Positioned(
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
                  child: GetBuilder<CartController>(builder: (cartController){
                    return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (_, index){
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            width: double.maxFinite,
                            height: 100,
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      //color: Colors.green,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!)
                                      )
                                  ),
                                ),
                                SizedBox(width: Dimensions.width20,),
                                Expanded(
                                  child: Container(
                                    //color: Colors.black,
                                    margin: EdgeInsets.symmetric(vertical: 7),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        BigText(text: "${cartController.getItems[index].name!}",),
                                        SmallText(text: "Spicy",),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(text: "${cartController.getItems[index]!.price}", color: Colors.redAccent,),
                                            SizedBox(width: 10,),
                                            Container(
                                              height: Dimensions.height50,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(Dimensions.radius15)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        //popularProduct.setQuantity(false);
                                                      },
                                                      child: Icon(Icons.remove, color: AppColors.signColor, size: Dimensions.width50,)),
                                                  BigText(text: "0"), // ${popularProduct.inCartItems}
                                                  GestureDetector(
                                                    onTap: (){
                                                      //popularProduct.setQuantity(true);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: AppColors.signColor,
                                                      size: Dimensions.width50,
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
                  })
                ),
              ))
        ],
      ),
    );
  }
}
