import 'package:app/utils/colors.dart';
import 'package:app/widgets/big_text.dart';
import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;

  const NoDataPage(
      {super.key,
      required this.text,
      this.imgPath = "assets/image/empty_cart.png"});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imgPath,
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          SizedBox(height: 10,),
          Center(child: BigText(text: text, color: Colors.grey[600],)),
        ],
      ),
    );
  }
}
