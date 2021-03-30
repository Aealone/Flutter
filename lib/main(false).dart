// import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// import 'package:shop_app/http/http_service.dart';
// // import 'package:shop_app/models/product_card.dart';
// // import 'package:shop_app/constants.dart';
// // import 'package:shop_app/screens/details/details_screen.dart';

// import 'package:shop_app/screens/home/components/products_grid.dart';


// // import 'package:shop_app/http/request_model.dart';
// // import 'package:shop_app/screens/home/components/products_grid.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override               
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final GlobalKey<ProductsGridState> futureGlobalKey = new GlobalKey<ProductsGridState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(
//         title: Text("DEMO"),
//       ),

//       body: ProductsGrid(key: futureGlobalKey),
//       // FutureBuilder <List<ProductInfo>>(
//       //   future: _myfuture, //fetchPosts(http.Client()),
//       //   builder: (BuildContext context, AsyncSnapshot<List<ProductInfo>> snapshot) {
//       //     if (snapshot.hasError) print(snapshot.error);

//       //     return snapshot.hasData
//       //         ? DraggableScrollableSheet(
//       //             initialChildSize: 0.7,
//       //             minChildSize: 0.7,
//       //             builder: (BuildContext context, ScrollController scrollController) {
//       //               return Container(
//       //                 color: Colors.white,
//       //                 child: GridView.builder(
//       //                   controller: scrollController,
//       //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       //                     childAspectRatio: 0.4,
//       //                     crossAxisCount: 2,
//       //                     crossAxisSpacing: kDefaultPadding,
//       //                     mainAxisSpacing: kDefaultPadding,
//       //                   ),
//       //                   itemCount: snapshot.data.length,

//       //                   itemBuilder: (context, index) {
//       //                     // print(posts[index].image.toString());
//       //                     return ProductCard(
//       //                       product: snapshot.data[index],
//       //                       press: () => 
//       //                         Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: snapshot.data[index]),
//       //                         )),
//       //                       // id:  productsInfo[index].id,
//       //                       // image: productsInfo[index].image.toString(),
//       //                       // sizes: productsInfo[index].sizes.toString(),
//       //                       // brand: productsInfo[index].brand,
//       //                       // oldPrice: productsInfo[index].oldPrice,
//       //                       // newPrice: productsInfo[index].newPrice,
//       //                     );
//       //                   },
//       //                 ),
//       //               );
//       //             },
//       //           )
//       //         : Center(child: CircularProgressIndicator());
//       //   },
//       // ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: _addPressed,
//         tooltip: 'Increment',
//         child: Text('Go'),
//       ),
//     );
//   }

//   void _addPressed() {
//     //somehow call _updateSeconds()
//     futureGlobalKey.currentState.updateGrid(HttpService().getPosts("adidas", "1000", "3000"));
//   }
// }