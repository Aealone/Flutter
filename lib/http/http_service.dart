import 'package:discount_app/drawer/components/drawer_info.dart';
import 'package:discount_app/http/request_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpService {
  Future<List<ProductInfo>> getPosts(String brands, String priceMin, String priceMax) async {
    http.Response res = await http.get("http://localhost:5000/?brand=$brands&priceMin=$priceMin&priceMax=$priceMax"); 
    if (res.statusCode == 200) {

      List<dynamic> body = jsonDecode(res.body);
      
      List<ProductInfo> productsInfo = body
        .map(          
          (dynamic item) => ProductInfo.fromJson(item),
        )
        .toList();

      if (brandsUniq.isEmpty){
        List<String> brandsList = body
          .map(          
            (dynamic item) => item["brand"].toString(),
          )
          .toSet().toList();
      brandsList.sort();
      List<bool> listOfFalse = List.generate(brandsList.length, (index) => false);
      brandsUniq = Map.fromIterables(brandsList, listOfFalse);
      }
      return productsInfo;
    } else {
      throw "Can't get information about products.";
    }
  }
}