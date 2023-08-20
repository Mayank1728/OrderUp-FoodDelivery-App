import 'package:app/models/products_model.dart';
import 'package:get/get.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get itmes => _items;

  void addItem(ProductModel productModel, int quantity) {
    if (_items[productModel.id!] != null) {
      _items.update(productModel.id!, (value) {
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    } else {
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
        );
      }

      );
    }
  }
}