import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  void addToCarList(List<CartModel> cartList){
    cart = [];
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });
    // sharedpref only accepts strings
    sharedPreferences.setStringList("Cart-list", cart);
    print(sharedPreferences.getStringList("Cart-list"));
  }
}