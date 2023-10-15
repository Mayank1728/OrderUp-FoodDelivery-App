# OrderUp current status
https://github.com/Mayank1728/OrderUp-FoodDelivery-App/assets/71082230/e2560228-6440-46b3-9de8-27aa9ebbe8f7



# MVC(Model View Controller) Pattern
![App Architecture](https://github.com/Mayank1728/Food-Delivery-App/assets/71082230/8b601cd8-b68b-407f-a7e8-ad93863dcae5)

# Download
Download APK file from here: https://github.com/Mayank1728/OrderUp-FoodDelivery-App/releases/tag/v1.0 <br>
VirusTotal Result: https://www.virustotal.com/gui/file/ab822df093084d64e9b568fae030ff4c8403b2c3681f51195cc926c091de61a4?nocache=1 <br>


# Things I learned
1. Networking: https://mayank1728.hashnode.dev/15-things-i-learned-about-networking
2. Flutter Framework:
3. Dart:
4. Dependency Injection: https://www.youtube.com/watch?v=IKD2-MAkXyQ
5. GetX:
6. Object oriented programming
7. MVC pattern: https://mayank1728.hashnode.dev/eli5-mvc-pattern
8. php and laravel: 
9. backend:
10. mySQL

## Libraries Used
1. GetX: GetX is used for dependency injection(passing instance of 1 class into another), Routing which is navigation b/w pages, state management(State means data, so when data changes these changes are reflected in UI), Included snackbars, GetX controller and some interfaces.

2. Dots Indicator: UI library to show dots animation below the horizontal listview on the homepage.

3. Shared-Preferences: Used to store the data inside LOCALSTORAGE as string and retreive data and convert back to models. Used to store cartModels for Cart-History and Cart in form of Key-Value pair. This makes sure state persistence.

4. Intl: For converting time from 1 international format to another.

## Project Structure
* Base
  + NoDataPage.dart

* Controllers
  + CartControllers.dart
	+ popularProductController.dart
	+ recommendedProductController.dart

* Data
  + Api
    - ApiClient.dart
	+ Repository
	  - CartRepo.dart
		- PopularProductRepo.dart
		- RecommendedProductRepo.dart

* Helper
  + Dependencies.dart

* Modles
  + CartModel.dart
	+ ProductModel.dart
    
* Pages
  + Account
		- AccountPage.dart
	+ Auth
	  - SignUpPage.dart
	+ Cart
	  - CartHistoryPage.dart
		- CartPage.dart
	+ Food
	  - PopularFoodDetails.dart
		- RecommendedFoodDetails.dart
	+ Home
	  - FoodPageBody.dart
		- HomePage.dart
		- MainFoodPage.dart
	+ Splash
	  - SplashScreen.dart
  
* Routers
  + RouteHelper.dart
    
* Utils
  + AppConstants.dart
	+ Colors.dart
	+ Dimensions.dart
    
* Widgets
  + AppColumn.dart
	+ AppIcon.dart
	+ BigText.dart
	+ ExpandableText.dart
	+ IconAndText.dart
	+ SmallText.dart
    
* main.dart

