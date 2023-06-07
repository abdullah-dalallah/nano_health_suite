import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nano_health_suite/data.dart';
import 'package:nano_health_suite/models/product_item.dart';
import 'package:nano_health_suite/models/product_details.dart';

class ProductProvider with ChangeNotifier {
  List<ProductItem> _allProducts =[];
  ProductDetails _productDetails =new ProductDetails();


  set allProducts(List<ProductItem> value) {
    _allProducts = value;
  }

  List<ProductItem> get allProducts => _allProducts;

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
        json.forEach((element){
          _allProducts.add(ProductItem.fromJson(element));
        });


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


  Future<Response<dynamic>> getProductDetails(int productId) async {
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