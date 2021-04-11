import 'package:flutter/material.dart';
// import 'dart:convert';
import 'dart:async';

// import 'package:http/http.dart' as http;
import 'package:shop_app/http/http_service.dart';
import 'package:shop_app/models/product_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/details/details_screen.dart';

// import 'package:shop_app/screens/home/components/products_grid.dart';


import 'package:shop_app/http/request_model.dart';
// import 'package:shop_app/screens/home/components/products_grid.dart';

final GlobalKey<ProductsGridState> futureGlobalKey = new GlobalKey<ProductsGridState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override               
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductsGrid(key: futureGlobalKey),
    );
  }
}

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

class ProductsGrid extends StatefulWidget {
  ProductsGrid({Key key}) : super(key: key);

  @override
  ProductsGridState createState() => ProductsGridState();

}

class ProductsGridState extends State<ProductsGrid> {
  Future<List<ProductInfo>> myfuture;

  void initState() {
    myfuture = HttpService().getPosts("PUMA", "4400", "4800");
    super.initState();
  }

  void updateGrid(Future<List<ProductInfo>> newFuture) {
    setState(() {
      myfuture = newFuture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ProductInfo>>(
        future: myfuture,
        builder: (BuildContext context, AsyncSnapshot<List<ProductInfo>> snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? MyHome(productsInfo: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      );
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////// 

class MyHome extends StatefulWidget {
  final List<ProductInfo> productsInfo;

  MyHome({Key key, this.productsInfo}) : super(key: key);

  @override
  _MyHomeState createState() => new _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Scrollbar(
        child: new GridView.builder(
          controller: controller,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.4,
            crossAxisCount: 2,
            crossAxisSpacing: kDefaultPadding,
            mainAxisSpacing: kDefaultPadding,
          ),
          itemCount: widget.productsInfo.length,
          itemBuilder: (context, index) {
            return ProductCard(
                product: widget.productsInfo[index],
                press: () => 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: widget.productsInfo[index]),
                  )),
              );
          },
        ),
      ),
    );
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {
        // widget.productsInfo.addAll(HttpService().getPosts("adidas", "4000", "4500"));
        // futureGlobalKey.currentState.updateGrid(HttpService().getPosts("adidas", "4000", "4500"));
      });
    }
  }
}