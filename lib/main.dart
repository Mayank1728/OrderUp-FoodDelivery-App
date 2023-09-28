import 'package:app/pages/home/home_page.dart';
import 'package:app/pages/splash/splash_page.dart';
import 'package:app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
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
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder:(_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          getPages: RouteHelper.routes,
          // home: MainFoodPage(),
          // home: PopularFoodDetails()
          //home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          //home: CartPage(),
        );
      });
    });
  }
}