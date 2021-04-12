import 'package:discount_app/http/request_model.dart';
import 'package:discount_app/http/http_service.dart';
import 'package:flutter/material.dart';
import 'package:discount_app/screens/home/components/product_card.dart';
import 'package:discount_app/constants.dart';
import 'package:discount_app/screens/details/details_screen.dart';
import 'package:discount_app/screens/home/components/sort_price_sale.dart';

List<ProductInfo> productsList = [];

class ProductsGrid extends StatefulWidget {
  ProductsGrid({Key key}) : super(key: key);

  @override
  ProductsGridState createState() => ProductsGridState();

}

class ProductsGridState extends State<ProductsGrid> {
  Future<List<ProductInfo>> myfuture;

  void initState() {
    myfuture = HttpService().getPosts("PUMA", "4000", "4400");
    super.initState();
  }

  void updateProductsGrid(String brands, String minPrice, String maxPrice) {
    setState(() {
      myfuture = HttpService().getPosts(brands, minPrice, maxPrice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ProductInfo>>(
        future: myfuture,
        builder: (BuildContext context, AsyncSnapshot<List<ProductInfo>> snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          if (snapshot.hasData) {
            productsList = snapshot.data;
            return Grid(key: gridGlobalKey);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
  }
}

class Grid extends StatefulWidget {
  Grid({Key key}) : super(key: key);

  @override
  GridState createState() => GridState();
}

class GridState extends State<Grid> {

  void updateGrid(List<ProductInfo> newproductsList) {
    setState(() {
      productsList = newproductsList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.67,
      minChildSize: 0.67,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: GridView.builder(
            controller: scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.44,
              crossAxisCount: 2,
              crossAxisSpacing: kDefaultPadding,
              mainAxisSpacing: kDefaultPadding,
            ),
            itemCount: productsList.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: productsList[index],
                press: () => 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: productsList[index]),
                  )),
              );
            },
          ),
        );
      },
    );
  }
}