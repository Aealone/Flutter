import 'package:flutter/material.dart';
import 'package:shop_app/drawer/components/drawer_info.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'request_model.dart';

class HttpService {
  // final String mainURL = "http://localhost:5000/?brand=PUMA&sizeMin=44&sizeMax=45&priceMin=1000&priceMax=3000";

  Future<List<ProductInfo>> getPosts(String brands, String priceMin, String priceMax) async {
    
    http.Response res = await http.get("http://localhost:5000/?brand=$brands&priceMin=$priceMin&priceMax=$priceMax"); 
    if (res.statusCode == 200) {

      // final List<String> brandsList = [];
      // var idm = ids.toSet().toList();
      // print(idm);

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

        // brandsList = brandsList.toSet().toList();
      
        List<bool> listOfFalse = List.generate(brandsList.length, (index) => false);
        brandsUniq = Map.fromIterables(brandsList, listOfFalse);
        // print(brandsList);
      }

      return productsInfo;
    } else {

      throw "Can't get information about products.";
    }
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'posts_model.dart';
// import 'package:http/http.dart' as http;

// Future<List<Post>> fetchPosts(http.Client client) async {
//   final response = await client
//       .get(Uri.parse('http://localhost:5000/?brand=PUMA'));

//   // Use the compute function to run parsePhotos in a separate isolate.
//   return compute(parsePosts, response.body);
// }

// // A function that converts a response body into a List<Photo>.
// List<Post> parsePosts(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Post>((json) => Post.fromJson(json)).toList();
// }