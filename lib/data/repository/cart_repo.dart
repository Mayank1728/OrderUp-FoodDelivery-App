import 'dart:convert';

import 'package:app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
  late SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = []; // cart data is stored in local storage
  List<String> cartHistory = []; // cart history is also stored in local storage

  // CART_LIST => key of sharedpref to store items in the cart
  // CART_HISTORY_LIST => key of sharedpref to store_____________

  // this function converts cartModels inside the cart
  // into string data and saves inside local storage
  // each time you add food to cart
  void addToCartList(List<CartModel> cartList){
    /// name should be saveCartToLocalStorage
    /// whenever you add any item to cart, this func is called
    /// time on all the cartModels is updated and
    /// list of cartModels is saved in localstorage as strings
    /// inside cart[]

    // sharedPreferences.remove(AppConstants.CART_LIST);
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    // return;
    // when removing the data from localstorage by uncommenting above
    // make sure to restart the app
    var time = DateTime.now().toString();
    cart = [];
    cartList.forEach((element) {
      element.time = time;
      // time prop of each cart model will be
      // that time when u clicked on place order button
      // so that we can easily group orderHistory items by time order placed
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
    /// name should be retreiveCartItemsFromLocalStorage
    // revive items in the cart from the localstorage when user switches from diff app
    List<String> itemsInCartAsStr = [];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      itemsInCartAsStr = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }
    List<CartModel> itemsInCart = [];
    // here we convert back json strings to cartModels
    itemsInCartAsStr.forEach((e) {
      itemsInCart.add(CartModel.fromJson(jsonDecode(e)));
    });
    return itemsInCart;
  }

  // revives cartHistory data from local storage
  List<CartModel> getCartHistoryList(){
    /// get cartHistory from localstorage, convert it to cartModels
    /// and return the List<CartModel>
    cartHistory = [];
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartHistoryList = [];
    cartHistory.forEach((element) => cartHistoryList.add(CartModel.fromJson(jsonDecode(element))));
    return cartHistoryList;
  }

  // when u click on place order
  // the cartmodels inside the cart are removed
  // and this data is saved as cartHistory
  void addToCartHistoryList(){
    /// first cartHistory is loaded from localstorage
    /// then current CartItems are added in the cart history
    /// using cart variable
    /// remove cart is called to delete all the items inside the cart
    /// cartHistory is updated

    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for(int i = 0; i < cart.length; i++){
      //print("History is "+ cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    // add some sound etc to know your order is placed
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
    print(getCartHistoryList().length);
  }

  void removeCart(){
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}