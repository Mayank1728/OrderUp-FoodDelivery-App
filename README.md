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
	+ [PopularProductController.dart](#PopularProductController)
	+ [RecommendedProductController.dart](#RecommendedProductController)
	+ [CartControllers.dart](#CartController)

* Data
	+ Api
  		- [ApiClient.dart](#Api)
	+ Repository
		- [CartRepo.dart](#CartRepo)
		- [PopularProductRepo.dart](#PopularProductRepo)
		- [RecommendedProductRepo.dart](#RecommendedProductRepo)

* Helper
	+ [Dependencies.dart](#Dependencies)

* Models
	+ [CartModel.dart](#CartModel)
    + [ProductModel.dart](#ProductModel)
    
* [Pages](#Pages)
	+ Account
		- [AccountPage.dart](#AccountPage)
	+ Auth
		- [SignUpPage.dart](#SignUpPage)
	+ Cart
		- [CartHistoryPage.dart](#CartHistoryPage)
		- [CartPage.dart](#CartPage)
	+ Food
		- [PopularFoodDetails.dart](#PopularFoodDetails)
		- [RecommendedFoodDetails.dart](#RecommendedFoodDetails)
	+ Home
		- [FoodPageBody.dart](#FoodPageBody)
		- [HomePage.dart](#HomePage)
		- [MainFoodPage.dart](#MainFoodPage)
	+ Splash
		- [SplashScreen.dart](#SplashScreen)
  
* [Routers](#Routers)
  	+ [RouteHelper.dart]
    
* [Utils](#Utils)
  	+ [AppConstants.dart]
	+ [Colors.dart]
	+ [Dimensions.dart]
    
* [Widgets](#Widgets)
	+ [AppColumn.dart]
	+ [AppIcon.dart]
	+ [BigText.dart]
	+ [ExpandableText.dart]
	+ [IconAndText.dart]
	+ [SmallText.dart]
    
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
	- popularProductRepo: reference variable to the PopularProductRepo object passed inside the constructor.
    - _popularProductList: List<Dynamic> and used to store all the ProductModels. Product class contains ProductModel.
	- _cart: CartController and 
	- isLoaded: bool variable which gets updated to true when the JSON response is received and converted to ProductModel.
	- _quantity: int and holds the quantity of current/this product item. For example cake ProductModel might have _quantity = 2 and others 0.
	- _inCartItems: int and total items present inside the cart.
  
- Member Functions
	- getPopularProductList(): awaits for popularProductRepo to fetch JSON response and converts it into ProductModels. All the ProductModels are then added to the _popularProductList.
	- setQuantity(bool): when you pass true, quantity is increased otherwise its decreased. However, before increasing/decreasing sanity checks are performed using checkQuantity();
	- checkQuantity(int): provides sanity checks such as quantity CANNOT be less than 0. Moreover, you cannot add any item more than 20 times. Also, snackbars are displayed when quantity < 0 or quantity > 20.
	- initProduct(ProductModel, CartController): RESETS variables like _quantity to 0 and _inCartItems to 0 inside PopularProductController whenever you click on a product. Also if the product exits in the cart, _inCartItems value is updated.
	- addItem(ProductModel): Adds a ProductModel of a specific quantity inside the CartController. Quantity is reset to 0 and _inCartItems are updated.
- Getters
  - totalItems: returns total-quantity of items present inside the cart.
  - getItems: what items are present inside the cart. returns List<CartModel>.

## RecommendedProductController
RecommendedProductController is the same as PopularProductController. It accepts instance of RecommendedProductRepo as parameter.
- Attributes
  - _recommendedProductList: List used to store all the ProducModels.
  - _isLoaded: to check where response is converted to ProductModel
- Member Functions
  - getRecommendedProductList: awaits for the RecommendedProductsRepo to fetch response and convert it into ProductModels and add all the ProductModels into _recommendedProductList.


## CartController
CartController extends GetxController and its constructor expects instance of CartRepo.
Note: CartModel represents items present inside the cart. CartModel contains all the properties of ProductModel with quantity, time and productModel reference.
- Attributes
  - _items: is a Map<int, CartModels> , used to store items present inside the cart.
  - storageItems: 
- MemberFunctions
  - addItem(ProductModel, int): If productModel.id exits in cart, quantity is updated inside the cartModel the productId refers to. Otherwise the productModel.id key is created which refers to its CartModel.
  - existInCart(ProductModel): returns true if the ProductModel exists in cart otherwise false.
  - getQuantity(ProductModel): returns quantity of ProductModel present inside the cart otherwise returns 0 when ProductModels doesn't exists inside _items.
  - getCartData(): 
  - addToHistory(): addToCartHistoryList from cartRepo is called and then clear() is called.
  - clear(): the cart is cleared by setting _items = {} and update() is called.
  - getCartHistoryList(): CartHistoryList is called on cartRepo and this list is returned.
- Getters and setters
  - get totalItems: returns total quantity of items present insie the cart or _items map.
  - get getItems: returns List<CartModel>. Makes a list of all the values present inside _items map. Finally this list is returned.
  - totalAmount: List<CartModel> is accepted from getItems. Now we loop through the list to calculate total amount / bill by summing quantity of each item with its respective price. Finally totalBill is returned.
  - set setCart: 

# API
## ApiClient
ApiClient constructor expects **BaseUrl** for the API, which is imported from AppConstants.dart file. ApiClient class object is initialized in dependencies.dart file.
Member function
- getData(String): returns Future<response> and getData expects route string to fetch data from. Ex- '/api/v1/products/popular'

# Repository
Repository deals with how data is stored and retrieved in MVC.
## CartRepo
CART_LIST and CART_HISTORY_LIST act as key for storing cart data and cart history data.
- Attributes:
  - sharedPreferences: Instance of SharedPreferences.
  - cart: List<String> type and used to store cartData in this variable.
  - cartHistory: List<String> type and used to store CartHistoryData in this variable.
- Member function:
  - addToCartList(List<CartModel>): time on each of the CartModel is updated and then CartModels are converted to string using jsonEncode and added to the cart[]. Then this array is stored inside the sharedPref.
  - getCartList(): returns List<CartModel>. If CART_LIST key exists inside sharedPref data is loaded inside an array. Then we loop through the array and convert string to CartModel using CartModel.fromJSON().
  - getCartHistoryList():
  - addToCartHistoryList():
  - removeCart():



# MVC(Model View Controller) Pattern
![App Architecture](https://github.com/Mayank1728/Food-Delivery-App/assets/71082230/8b601cd8-b68b-407f-a7e8-ad93863dcae5)

# Download
Download APK file from here: https://github.com/Mayank1728/OrderUp-FoodDelivery-App/releases/tag/v1.0 <br>
VirusTotal Result: https://www.virustotal.com/gui/file/ab822df093084d64e9b568fae030ff4c8403b2c3681f51195cc926c091de61a4?nocache=1 <br>

# Critiques
1. Pranav Chand: User is not getting any validation that order has been placed. Will insert sound and a new page where user is confirmed order is displayed.
2. Nitin Desai: User is not receiving any validation item has been added to the cart. Will insert snackbar whenever item is added inside the cart.
3. Trayi Kashyap: What makes your app unique from other food-delivering apps.

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

