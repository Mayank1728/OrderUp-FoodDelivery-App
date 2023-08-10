import 'package:app/utils/colors.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/app_icon.dart';
import 'package:app/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(iconData: Icons.close, iconSize: 50,),
                  AppIcon(iconData: Icons.shopping_cart_outlined)
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height50),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius15),
                      topRight: Radius.circular(Dimensions.radius15)
                    )
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: Dimensions.height5, bottom: Dimensions.height5),
                  child: Center(
                    child: BigText(text: "Heading", size: Dimensions.font30),
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.mainColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/image/food2.png",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height30, bottom: Dimensions.height30),
                      child: ExpandableTextWidget(text: """Hello 


Justo cras orci turpis justo pede egestas cum accumsan pretium eleifend per viverra cursus augue. Dictumst mollis dignissim mattis id. Hymenaeos parturient ligula.

Iaculis vehicula tincidunt augue ut adipiscing velit Vulputate montes. At lectus dictum nascetur non. Nibh. Habitant mattis. Ante orci lobortis diam, venenatis curabitur lacus amet metus nam augue natoque consectetuer risus curabitur metus feugiat proin torquent donec, pretium. Sed erat maecenas nisi nascetur purus adipiscing.

Pretium cubilia viverra pellentesque nulla Adipiscing non etiam per suspendisse odio turpis augue congue, pulvinar, class, nascetur eu. Tristique maecenas tortor vitae fames luctus torquent consequat at mi venenatis, etiam gravida justo.

Justo cras orci turpis justo pede egestas cum accumsan pretium eleifend per viverra cursus augue. Dictumst mollis dignissim mattis id. Hymenaeos parturient ligula.

Iaculis vehicula tincidunt augue ut adipiscing velit Vulputate montes. At lectus dictum nascetur non. Nibh. Habitant mattis. Ante orci lobortis diam, venenatis curabitur lacus amet metus nam augue natoque consectetuer risus curabitur metus feugiat proin torquent donec, pretium. Sed erat maecenas nisi nascetur purus adipiscing.

Pretium cubilia viverra pellentesque nulla Adipiscing non etiam per suspendisse odio turpis augue congue, pulvinar, class, nascetur eu. Tristique maecenas tortor vitae fames luctus torquent consequat at mi venenatis, etiam gravida justo.
 world"""),
                    ),

                  ],
                )
            )

          ],
        ),
      bottomNavigationBar: Container(
        // padding: EdgeInsets.only(bottom: Dimensions.height50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width30, right: Dimensions.width30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(iconData: Icons.remove, backgroundColor: AppColors.mainColor, iconColor: Colors.white,),
                  BigText(text: "\$17.28 " +"X"+ " 0", size: 27,),
                  AppIcon(iconData: Icons.add, backgroundColor: AppColors.mainColor,iconColor: Colors.white,)
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height15,
                  left: Dimensions.width30,
                  right: Dimensions.width30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius15),
                      topRight: Radius.circular(Dimensions.radius15)),
                  color: Colors.grey.shade300),
              child: Row(
                // can fix the button sizes
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 75,
                    width: 60,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.radius15)),
                    child: AppIcon(iconData: Icons.favorite, iconColor: AppColors.mainColor, backgroundColor: Colors.white,),
                  ),
                  Container(
                    height: 75,
                    width: 185,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(
                          text: "\$29 | Add to Cart",
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
