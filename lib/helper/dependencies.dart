import 'package:app/controllers/cart_controller.dart';
import 'package:app/controllers/popular_product_controller.dart';
import 'package:app/data/api/api_client.dart';
import 'package:app/data/repository/cart_repo.dart';
import 'package:app/data/repository/popular_product_repo.dart';
import 'package:app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences);
  // API client
  Get.put(ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Repos
  // Honestly Repos are not doing much here
  // Basically are just a layer between controller and API client
  Get.put(PopularProductRepo(apiClient: Get.find()));
  Get.put(RecommendedProductRepo(apiClient: Get.find()));
  Get.put(CartRepo(sharedPreferences: Get.find<SharedPreferences>()));

  // Controllers
  Get.put(PopularProductController(popularProductRepo: Get.find()));
  Get.put(RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.put(CartController(cartRepo: Get.find()));
}
