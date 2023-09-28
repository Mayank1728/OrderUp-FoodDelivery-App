import 'dart:convert';

import 'package:app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = []; // cart data is stored in local storage
  List<String> cartHistory = []; // cart history is also stored in local storage

  // this function converts cartModels inside the cart
  // into string data and saves inside local storage
  // each time you add food to cart
  void addToCarList(List<CartModel> cartList){
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart = [];
    cartList.forEach((element) {
      element.time = time;
      // time prop of each cart model will be
      // that time when u clicked on place order button
      return cart.add(jsonEncode(element));
    });
    // sharedpref only accepts strings
    // so we converted cartModels into json Strings
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
  }

  // revives cart data from local storage
  // and returns cartModel list
  List<CartModel> getCartList(){
    List<String> prevOrderStr = [];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      prevOrderStr = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }
    List<CartModel> prevOrder = [];
    // here we convert back json strings to cartModels
    prevOrderStr.forEach((e) {
      prevOrder.add(CartModel.fromJson(jsonDecode(e)));
    });
    return prevOrder;
  }

  // revives cartHistory data from local storage
  List<CartModel> getCartHistoryList(){
    cartHistory = [];
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartHistoryList = [];
    cartHistory.forEach((element) => cartHistoryList.add(CartModel.fromJson(jsonDecode(element))));
    return cartHistoryList;
  }

  // when u click on place order
  // the cartmodels inside the cart is removed
  // and this data is saved as cartHistory
  void addToCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for(int i = 0; i < cart.length; i++){
      //print("History is "+ cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
    print(getCartHistoryList().length);
  }

  void removeCart(){
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}