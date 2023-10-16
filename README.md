# OrderUp App Demo
https://github.com/Mayank1728/OrderUp-FoodDelivery-App/assets/71082230/e2560228-6440-46b3-9de8-27aa9ebbe8f7

## Libraries Used

1. **GetX**: GetX is used for dependency injection(passing instance of 1 class into another), Routing which is navigation b/w pages, state management(State means data, so when data changes these changes are reflected in UI), Included snackbars, GetX controller and some interfaces.

2. **Dots Indicator**: UI library to show dots animation below the horizontal listview on the homepage.

3. **Shared-Preferences**: Used to store the data inside LOCALSTORAGE as string and retreive data and convert back to models. Used to store cartModels for Cart-History and Cart in form of Key-Value pair. This makes sure state persistence.

4. **Intl**: For converting time from 1 international format to another.

## Project Structure

* [Base](#Base)
	+ NoDataPage.dart

* [Controllers](#Controllers)
	+ [PopularProductController.dart](##PopularProductController)
	+ [RecommendedProductController.dart](##RecommendedProductController)
	+ [CartControllers.dart](##CartController)

* [Data](#Data)
	+ [Api](#Api)
  		- ApiClient.dart
	+ [Repository](#Repository)
		- CartRepo.dart
		- PopularProductRepo.dart
		- RecommendedProductRepo.dart

* [Helper](#Helper)
	+ Dependencies.dart

* [Models](#Models)
	+ CartModel.dart
		- ProductModel.dart
    
* [Pages]
	+ [Account](#Account)
		- AccountPage.dart
	+ [Auth](#Auth)
		- SignUpPage.dart
	+ [Cart](#Cart)
		- CartHistoryPage.dart
		- CartPage.dart
	+ [Food](#Food)
		- PopularFoodDetails.dart
		- RecommendedFoodDetails.dart
	+ [Home](#Home)
		- FoodPageBody.dart
		- HomePage.dart
		- MainFoodPage.dart
	+ [Splash](#Splash)
		- SplashScreen.dart
  
* [Routers](#Routers)
  	+ RouteHelper.dart
    
* [Utils](#Utils)
  	+ AppConstants.dart
	+ Colors.dart
	+ Dimensions.dart
    
* [Widgets](#Widgets)
	+ AppColumn.dart
	+ AppIcon.dart
	+ BigText.dart
	+ ExpandableText.dart
	+ IconAndText.dart
	+ SmallText.dart
    
* [main.dart](#main.dart)

# Base
* _NoDataPage_: A stateless page to visualise cart is empty and orderHistory is empty. Constructor expects <br>
imgPath and text of which text is Required attribute. <br>

# Controllers
Controllers are used to control the flow of data between UI and Models(Data storage like sql etc). <br>
![firefox_UchmNqasHb](https://github.com/Mayank1728/OrderUp-FoodDelivery-App/assets/71082230/4163421f-e40f-4c76-bf4e-8319a8db0526)

There are 3 controllers
## PopularProductController
PopularProductController extends GetxController class and the constructor expects an instance of PopularProductRepo class.
- Attributes 
	1. popularProductRepo: reference variable to the PopularProductRepo object passed inside the constructor.
	2. _popularProductList: List<Dynamic> and used to store all the ProductModels. Product class contains ProductModel.
	3. _cart: CartController and 
	4. isLoaded: bool variable which gets updated to true when the JSON response is received and converted to ProductModel.
	5. _quantity: int and holds the quantity of current/this product item. For example cake ProductModel might have _quantity = 2 and others 0.
	6. _inCartItems: int and 
	7. 
- Member Functions
	1. getPopularProductList(): awaits for popularProductRepo to fetch JSON response and converts it into ProductModels. All the ProductModels are then added to the _popularProductList.
	2. setQuantity(bool): when you pass true quantity is increased otherwise its decreased. However, before increasing/decreasing sanity checks are performed using checkQuantity();
	3. checkQuantity(int): provides sanity checks such as quantity CANNOT be less than 0. Moreover, you cannot add any item more than 20 times. Also, snackbars are displayed when quantity < 0 or quantity > 20.
	4. initProduct(ProductModel, CartController): Used to create instance of ProductModel inside the cart.
	5. addItem(ProductModel):


## RecommendedProductController

## CartController
	

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

