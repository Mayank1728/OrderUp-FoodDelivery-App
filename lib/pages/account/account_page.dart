import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 70,
            // margin: EdgeInsets.only(top: 20),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
            ),
            child: Center(
                child: BigText(
                  text: "My Account",
                  color: Colors.white,
                  size: 27,
                )),
          ),
          Container(
            child: Icon(
              Icons.account_circle_rounded,
              size: 205,
              color: AppColors.mainColor,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.maxFinite,
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 60,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "Mayank Mudgal")
                    ],
                  )),
              Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.maxFinite,
                  // color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 60,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "+91-729XXXXX69")
                    ],
                  )),
              Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.maxFinite,
                  // color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 60,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "mm1919@srmist.edu.in")
                    ],
                  )),
              Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.maxFinite,
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 60,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "Gurgaon, Haryana")
                    ],
                  )),
              Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.maxFinite,
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        size: 60,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "None")
                    ],
                  )),
              Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.maxFinite,
                  // color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.help_outline_outlined,
                        size: 60,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "Customer Sevice")
                    ],
                  )),
            ],
          ))
        ],
      )),
    );
  }
}
