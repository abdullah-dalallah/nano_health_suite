import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nano_health_suite/data.dart';
import 'package:nano_health_suite/models/all_products.dart';
import 'package:nano_health_suite/models/product_details.dart';

class ProductProvider with ChangeNotifier {
  List<AllProducts> _allProducts =[];
  ProductDetails _productDetails =new ProductDetails();


  set allProducts(List<AllProducts> value) {
    _allProducts = value;
  }

  List<AllProducts> get allProducts => _allProducts;

  ProductDetails get productDetails => _productDetails;

  set productDetails(ProductDetails value) {
    _productDetails = value;
  }





  Future<Response<dynamic>> getAllProducts() async {
    const endPoint = '${Data.BaseUrl}/products';




    var dio = Dio();
    try {
      var response = await dio.get(endPoint,);
      if(response.statusCode ==200){

        var  json = response.data;
        print(_allProducts.runtimeType);
        print(json.runtimeType);
        _allProducts = json.cast<AllProducts>();


      }

      notifyListeners();
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        // print(e);
      }
      return e.response!;
    }
  }


  Future<Response<dynamic>> getProductDetails(String productId) async {
    var endPoint = '${Data.BaseUrl}/products/${productId}';




    var dio = Dio();
    try {
      var response = await dio.get(endPoint,);
      if(response.statusCode ==200){
       print(response.data);
        var  json = response.data;
        _productDetails  = ProductDetails.fromJson(json);

      }

      notifyListeners();
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        // print(e);
      }
      return e.response!;
    }
  }



}