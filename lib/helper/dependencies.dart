import 'package:app/controllers/popular_product_controller.dart';
import 'package:app/data/api/api_client.dart';
import 'package:app/data/repository/popular_product_repo.dart';
import 'package:app/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async{
  // API client
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}