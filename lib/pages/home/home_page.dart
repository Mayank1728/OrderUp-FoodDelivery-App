import 'package:app/pages/account/account_page.dart';
import 'package:app/pages/splash/splash_page.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../cart/cart_history.dart';
import 'main_food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    CartHistory(),
    Container(
      child: Center(
        child: Text("Cart Page"),
      ),
    ),
    AccountPage()
  ];
  void onTapNav(int index){
    setState(() {
        _selectedIndex = index;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapNav,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey[600],
        //showSelectedLabels: false,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.archive_outlined), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Account"),
        ],
      ),
    );
  }

}
