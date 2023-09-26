import 'package:app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel productModel, int quantity) {
    var totalQuantity = 0;
    if (_items[productModel.id!] != null) {
      _items.update(productModel.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: productModel,
        );
      });
      if (totalQuantity <= 0) _items.remove(productModel.id);
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(productModel.id!, () {
          print('ID: ${productModel.id}');
          print("Quantity: ${quantity}");
          print("total: ${_items.length}");
          return CartModel(
            id: productModel.id,
            name: productModel.name,
            price: productModel.price,
            img: productModel.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: productModel
          );
        });
      } else {
        Get.snackbar("Item Count", "Add atleast 1 item!",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    cartRepo.addToCarList(getItems);
    update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id!))
      return true;
    else
      return false;
  }

  int getQuantity(ProductModel product) {
    int quantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.forEach((key, value) {
        if (key == product.id!) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
    // we are converting map to list
    // the map contains <int,CartModel>
    // 0 -> CartModel0
    // 1 -> CartModel1 ..etc
    return _items.values.toList();
  }

  int get totalAmount{
    List<CartModel> items = getItems;
    int total = 0;
    for(int i = 0; i < items.length; i++){
      total += (items[i].quantity! * items[i].price!);
    }
    return total;
  }

}
