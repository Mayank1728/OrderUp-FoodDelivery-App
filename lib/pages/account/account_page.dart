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
          SizedBox(height: 15,),
          Container(
            height: 60,
            // margin: EdgeInsets.only(top: 20),
            width: double.maxFinite,
            child: Center(
                child: BigText(
                  text: "My Account",
                  color: AppColors.mainColor,
                  size: 27,
                )),
          ),
          Container(
            child: Icon(
              Icons.account_circle_rounded,
              size: 150,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(height: 25,),
          Expanded(
              child: ListView(
            children: [
              Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.maxFinite,
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 50,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "Mayank Mudgal")
                    ],
                  )),
              Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.maxFinite,
                  // color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 50,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "+91-729XXXXX69")
                    ],
                  )),
              Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.maxFinite,
                  // color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 50,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "mm1919@srmist.edu.in",size: 20,)
                    ],
                  )),
              Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.maxFinite,
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 50,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "Gurgaon, Haryana")
                    ],
                  )),
              Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.maxFinite,
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        size: 50,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BigText(text: "None")
                    ],
                  )),
              Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.maxFinite,
                  // color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.help_outline_outlined,
                        size: 50,
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
