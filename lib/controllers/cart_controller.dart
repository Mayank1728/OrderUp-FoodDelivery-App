import 'package:app/models/products_model.dart';
import 'package:get/get.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel productModel, int quantity) {
    if (_items[productModel.id!] != null) {
      _items[productModel.id!] = CartModel(
        id: productModel.id,
        name: productModel.name,
        price: productModel.price,
        img: productModel.img,
        quantity: quantity,
        isExist: true,
        time: DateTime.now().toString(),
      );
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
  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id!))
      return true;
    else
      return false;
  }

  getQuantity(ProductModel product){
    int quantity = 0;
    if(_items.containsKey(product.id!)){
      _items.forEach((key, value) {
        if(key == product.id!){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}