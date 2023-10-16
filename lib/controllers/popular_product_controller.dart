import 'package:app/controllers/cart_controller.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/popular_product_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;


  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int _inCartItems = 0;

  int get quantity => _quantity;

  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print('Got products');
      _popularProductList = <dynamic>[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update(); // this is a method present inside the GetxController
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
      print("Added now total is $_quantity");
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("Removed now total is $_quantity");
    }
    update();
  }
  int checkQuantity(int quantity) {
    if (_inCartItems + quantity < 0) {
      Get.snackbar("Item Count", "You can't reduce more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if(_inCartItems > 0){
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if (_inCartItems + quantity > 20) {
      Get.snackbar("Item Count", "Max Order Limit!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  /*
  *
  * RESETS variables like _quantity to 0 and _inCartItems to 0 inside PopularProductController whenever
  *  you click on a product. Also if the product exits in the cart, _inCartItems value is updated.
  * This means PopularProductController provides the data about qty of an item
  *
  * */
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //print("does exist: $exist");
    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    //if(_quantity > 0){
      _cart.addItem(product, _quantity);
      _quantity = 0; // why ? so that when u open same product next time, the value is updated from cart.
      _inCartItems = _cart.getQuantity(product);
      // _cart.items.forEach((key, value) {
      //   print('$key and ${value.quantity} are present');
      // });
    // } else {
    //   Get.snackbar("Item Count", "Add atleast 1 item!",
    //       backgroundColor: AppColors.mainColor, colorText: Colors.white);
    // }
    update();
  }

  // we have initialized getters here
  int get totalItems => _cart.totalItems;

  List<CartModel> get getItems => _cart.getItems;
}
