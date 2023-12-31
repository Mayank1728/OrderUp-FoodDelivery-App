import 'dart:async';

import 'package:app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  // stores what type of animation you want
  late AnimationController controller;
  // to control how long the animation lasts, fast or slow etc

  void _loadResource(){
    // loading the resources while the app loads
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    /// I am calling GetoffNamed from the splashscreen to homepage
    /// so that if user clicks back from home he exits the app
    /// instead of going to the splash screen
    ///
    /// GetoffNamed removes the screeen page from Navigation stack
    /// and bcz we called the ppc and rpc from here
    /// Getx thinks these controller classes are no longer required
    /// so deletes them
  }

  // here we are overriding the base class initState method
  // to initialize our controller and animation variable
  @override
  void initState() {
    super.initState();
    _loadResource();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 2), () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(scale: animation,
                child: Container(
                  height: 125,
                    width: 125,
                    child: Center(child: Image.asset("assets/image/final_logo.png",)))),
            Center(child: Image.asset("assets/image/slogan_2.png", width: 250,))
          ],
        ),
      ),
    );
  }
  /*
  * import 'dart:async';

import 'package:app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  // stores what type of animation you want
  late AnimationController controller;
  // to control how long the animation lasts, fast or slow etc

  void _loadResource(){
    // loading the resources while the app loads
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    /// I am calling GetoffNamed from the splashscreen to homepage
    /// so that if user clicks back from home he exits the app
    /// instead of going to the splash screen
    ///
    /// GetoffNamed removes the screeen page from Navigation stack
    /// and bcz we called the ppc and rpc from here
    /// Getx thinks these controller classes are no longer required
    /// so deletes them
  }

  // here we are overriding the base class initState method
  // to initialize our controller and animation variable
  @override
  void initState() {
    super.initState();
    _loadResource();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 1), () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(scale: animation,
            child: Center(child: Image.asset("assets/image/final_logo.png", width:100))),
            Center(child: Image.asset("assets/image/slogan_2.png", width: 250,))
          ],
        ),
      ),
    );
  }
}

  *
  *
  * */

}
