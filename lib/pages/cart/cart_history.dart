import 'package:app/controllers/cart_controller.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/app_icon.dart';
import 'package:app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var cartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = Map();
    // str is time and no of orders
    for(int i = 0; i < cartHistoryList.length; i++){
      if(cartItemsPerOrder.containsKey(cartHistoryList[i].time)){
        cartItemsPerOrder.update(cartHistoryList[i].time!, (value) => value + 1);
      }
      else{
        cartItemsPerOrder.putIfAbsent(cartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartOrderTimeToList (){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<int> orderTimes = cartOrderTimeToList();
    var saveCounter = 0;


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              padding: EdgeInsets.only(top: 10),
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 20, right: 20),
              //color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Order History", color: AppColors.mainColor,),
                  AppIcon(iconData: Icons.shopping_cart_outlined,
                      iconColor: AppColors.mainColor,
                  backgroundColor: Colors.grey[300]!,),
                ],
              ),
            ),
            Expanded(child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width30,
                right: Dimensions.width30,
              ),
              child: ListView(
                children: [
                  for(int i = 0; i < 5; i++)
                    BigText(text: "Hello world")
                ],
              ),
            ))
          ],
        ),
      )
    );
  }
}
