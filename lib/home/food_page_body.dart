import 'package:app/controllers/popular_product_controller.dart';
import 'package:app/controllers/recommended_product_controller.dart';
import 'package:app/pages/food/popular_food_detail.dart';
import 'package:app/routes/route_helper.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/icon_and_text_widget.dart';
import 'package:app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/products_model.dart';
import '../utils/app_constants.dart';
import '../widgets/big_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  var _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // page value increases slowly
        // even minute changes in pageController.page value
        // are set to currPageValue
        // print("Curr page value is ${_currPageValue.toString()}");
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageController
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  // color: Colors.redAccent,
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                );
        }),
        // Dots and animation
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: 6,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height50,
        ),
        // Popular and foodPairing
        Container(
          margin: EdgeInsets.only(left: Dimensions.height50),
          child: Row(
            children: [
              BigText(
                text: "Recommended",
                size: Dimensions.height30,
              ),
              SizedBox(
                width: Dimensions.width20,
              ),
              SmallText(
                text: "Food pairing",
              ),
            ],
          ),
        ),
        // Food and Listview
        // Recommended Food
        Container(
          height: 700,
          child: GetBuilder<RecommendedProductController>(
              builder: (recommendedProduct) {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRecommendedFood(index));
                  },
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(
                        left: Dimensions.height10,
                        right: Dimensions.height10,
                        bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        // Image Container
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstants.BASE_URL +
                                      "/uploads/" +
                                      recommendedProduct
                                          .recommendedProductList[index].img))),
                        ),
                        // Text and other things
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius15),
                                bottomRight:
                                    Radius.circular(Dimensions.radius15),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(
                                    text: recommendedProduct
                                        .recommendedProductList[index].name,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  SmallText(text: "Chinese characterstics"),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  Row(
                                    children: [
                                      IconAndWidget(
                                          icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      IconAndWidget(
                                          icon: Icons.location_on,
                                          text: "1.5km",
                                          iconColor: AppColors.mainColor),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      IconAndWidget(
                                          icon: Icons.access_time_rounded,
                                          text: "32mins",
                                          iconColor: AppColors.iconColor2)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    // bit Complex maths for scaling and transformations
    // for overlapping food and text
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - ((_currPageValue - index) * (1 - _scaleFactor));
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + ((_currPageValue - index + 1) * (1 - _scaleFactor));
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - ((_currPageValue - index) * (1 - _scaleFactor));
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          // Image
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFoodPage(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              // change to 15 both, rem top
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index % 2 == 0 ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.BASE_URL +
                          "/uploads/" +
                          popularProduct.img!))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              padding: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  top: Dimensions.height10),
              margin: EdgeInsets.only(
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                  bottom: Dimensions.height50),
              // change to 15 both, rem top
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: popularProduct.name!,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            popularProduct.stars!,
                            (index) => Icon(Icons.star,
                                color: AppColors.mainColor, size: 15)),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      SmallText(text: popularProduct.stars.toString()),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      SmallText(text: "1337", size: 14),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      SmallText(text: "comments", size: 14)
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      IconAndWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColors.iconColor1,
                        size: 15,
                      ),
                      SizedBox(
                        width: Dimensions.width20,
                      ),
                      IconAndWidget(
                        icon: Icons.location_on,
                        text: "1.5km",
                        iconColor: AppColors.mainColor,
                        size: 15,
                      ),
                      SizedBox(
                        width: Dimensions.width20,
                      ),
                      IconAndWidget(
                        icon: Icons.access_time_rounded,
                        text: "32mins",
                        iconColor: AppColors.iconColor2,
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
