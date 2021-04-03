import '../../../http/http_service.dart';
import '../../../http/request_model.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/details/details_screen.dart';

/////////////////////////////////////////////////////////////////////////////////////////// 

class ProductsGrid extends StatefulWidget {
  ProductsGrid({Key key}) : super(key: key);

  // final Future<List<ProductInfo>> myfuture;

  @override
  ProductsGridState createState() => ProductsGridState();

}

class ProductsGridState extends State<ProductsGrid> {
  Future<List<ProductInfo>> myfuture;

  void initState() {
    myfuture = HttpService().getPosts("", "", "");
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
        future: myfuture, //HttpService().getPosts("PUMA","1000", "3000"),
        builder: (BuildContext context, AsyncSnapshot<List<ProductInfo>> snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? Grid(productsInfo: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      );
  }
}
// class ProductsGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder <List<ProductInfo>>(
//         future: HttpService().getPosts("PUMA","1000", "3000"), //fetchPosts(http.Client()),
//         builder: (BuildContext context, AsyncSnapshot<List<ProductInfo>> snapshot) {
//           if (snapshot.hasError) print(snapshot.error);

//           return snapshot.hasData
//               ? Grid(productsInfo: snapshot.data)
//               : Center(child: CircularProgressIndicator());
//         },
//       );
//   }
// }

class Grid extends StatelessWidget {
  final List<ProductInfo> productsInfo;

  Grid({Key key, this.productsInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.65,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: GridView.builder(
            controller: scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.4,
              crossAxisCount: 2,
              crossAxisSpacing: kDefaultPadding,
              mainAxisSpacing: kDefaultPadding,
            ),
            itemCount: productsInfo.length,

            itemBuilder: (context, index) {
              return ProductCard(
                product: productsInfo[index],
                press: () => 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: productsInfo[index]),
                  )),
              );
            },
          ),
        );
      },
    );
  }
}

