import 'package:app/pages/food/popular_food_detail.dart';
import 'package:app/pages/food/recommended_food_detail.dart';
import 'package:app/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../pages/cart/cart_page.dart';
import '../pages/home/home_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  // Though I have declared static const variables I am still using getter
  // to get the data bcz smt i need to pass some data which will be used
  // by the next page I am navigating to, like popfoodpg and recommfoodpg
  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFoodPage(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(name: popularFood, page: (){
      print('Popular Food Page');
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page: (){
      print('Recommeend Food');
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
    },
    transition: Transition.fadeIn),
    GetPage(
      name: cartPage, page: (){
        return CartPage();
    },
      transition: Transition.fadeIn
    ),
  ];

}