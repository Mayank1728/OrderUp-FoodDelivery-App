import 'package:app/base/no_data_page.dart';
import 'package:app/controllers/cart_controller.dart';
import 'package:app/routes/route_helper.dart';
import 'package:app/utils/app_constants.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/app_icon.dart';
import 'package:app/widgets/big_text.dart';
import 'package:app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var cartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();
    // str is time and no of orders
    for (int i = 0; i < cartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(cartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            cartHistoryList[i].time!, (value) => value + 1);
      } else {
        cartItemsPerOrder.putIfAbsent(cartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<String> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    // itemsPerOrder contains keys of cartItemsPerOrder
    // cartHistoryList contains order history
    List<int> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;
    var cartController = Get.find<CartController>();

    Widget timeWidget(int index){
      var outputDate = DateTime.now().toString();
      if(index < cartHistoryList.length){
        DateTime parseDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(
            cartHistoryList[listCounter].time!);
        DateTime inputDate =
        DateTime.parse(parseDate.toString());
        var outputFormat =
        DateFormat("EEE, dd MMM yyyy HH:mm a");
        outputDate = outputFormat.format(inputDate);
      } else{
        listCounter = 0;
      }
      return BigText(text: outputDate, size: 20,);
    }

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: Dimensions.height100,
            padding: EdgeInsets.only(top: 10),
            width: double.maxFinite,
            margin: EdgeInsets.only(
                left: Dimensions.width30, right: Dimensions.width30),
            //color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: "Order History",
                  color: AppColors.mainColor,
                ),
                AppIcon(
                  iconData: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController){
            return Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                  ),
                  child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView(
                        children: [
                          for (int i = 0; i < itemsPerOrder.length; i++) // [3,3,1,2] in reverse
                            Container(
                              height: 120,
                              margin: EdgeInsets.only(bottom: Dimensions.height10),
                              child: Column(
                                // toString()
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  timeWidget(listCounter),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        children: List.generate(
                                            itemsPerOrder[i] > 3
                                                ? 3
                                                : itemsPerOrder[i], (index) {
                                          return Container(
                                            height: Dimensions.height100 - 11,
                                            width: Dimensions.height100 - 11,
                                            margin: EdgeInsets.only(
                                                top: 12, left: 5, right: 5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    Dimensions.radius15 / 2),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                        AppConstants.UPLOAD_URL +
                                                        cartHistoryList[listCounter++]
                                                            .product!
                                                            .img!))),
                                          );
                                        }),
                                      ),
                                      Container(
                                        //color: AppColors.yellowColor,
                                        height: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            SmallText(
                                              text: "Total",
                                              size: 18,
                                            ),
                                            BigText(
                                              text: "${itemsPerOrder[i]} Items",
                                              size: 23,
                                            ),
                                            Container(
                                                height: 25,
                                                width: 65,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius15 / 2),
                                                    border: Border.all(
                                                        color: AppColors.mainColor,
                                                        width: 1)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // Repeat order function
                                                    // itemsPerOrder contains keys of cartItemsPerOrder
                                                    // cartHistoryList contains order history <CartModel>
                                                    //List<int> itemsPerOrder = cartItemsPerOrderToList();
                                                    // [3, 2, 4, 3]
                                                    //var listCounter = 0;
                                                    cartController.clear();
                                                    int totalItems = itemsPerOrder[i];
                                                    int skip = 0;
                                                    for(int j = 0; j != i; j++){
                                                      skip += itemsPerOrder[j];
                                                    }
                                                    /*
                                              *   for(int j = skip + totalItems - 1; j >= skip ; j--){
                                                    var pm = cartHistoryList[j].product;
                                                    var qty = cartHistoryList[j].quantity;
                                                    cartController.addItem(pm!, qty!);
                                                   }
                                              *
                                              * */
                                                    // this for loop is reverse of above
                                                    // adds items to the cart in same order
                                                    for(int j = skip + totalItems - 1; j >= skip ; j--){
                                                      var pm = cartHistoryList[j].product;
                                                      var qty = cartHistoryList[j].quantity;
                                                      cartController.addItem(pm!, qty!);
                                                    }
                                                    Get.toNamed(RouteHelper.getCartPage());
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      BigText(
                                                        text: "Repeat",
                                                        size: 12,
                                                        color: AppColors.mainColor,
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ],
                      )),
                ));
          })
        ],
      ),
    ));
  }
}
