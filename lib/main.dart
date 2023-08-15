import 'package:app/pages/food/popular_food_detail.dart';
import 'package:app/pages/food/recommended_food_detail.dart';
import 'package:app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'home/food_page_body.dart';
import 'home/main_food_page.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: RouteHelper.routes,
      // home: MainFoodPage(),
      // home: PopularFoodDetails()
      home: MainFoodPage(),
      // initialRoute: RouteHelper.initial,
    );
  }
}