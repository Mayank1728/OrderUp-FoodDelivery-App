import 'package:app/utils/app_constants.dart';
import 'package:get/get.dart';

/// GetxService is an interface
/// ApiClient inherits from GetConnect
/// And since java DOESN'T allow multiple inheritance
/// we have interface class where you write the func prototype
/// and then complete the function inside the derived class


class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(uri) async{
    try{
        Response response = await get(uri);
        return response;
    } catch(e){
      return const Response(statusCode: 1, statusText: 'Could NOT fetch data!');
    }
  }
}