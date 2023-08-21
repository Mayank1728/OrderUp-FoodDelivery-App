import 'package:app/controllers/cart_controller.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
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
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if (quantity < 20) {
        _quantity++;
      } else
        Get.snackbar("Item Count", "Max Order Limit!",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
    } else {
      if (_quantity > 0)
        _quantity--;
      else
        Get.snackbar("Item count", "Orders cannot be less than 0",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
    }
    update();
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _cart.items.forEach((key, value){
      print('$key and ${value.quantity} are present');
    });
  }
}
