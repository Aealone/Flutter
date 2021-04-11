import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
// import 'package:shop_app/models/Product.dart';
// import 'package:shop_app/screens/details/details_screen.dart';

import 'package:shop_app/screens/home/components/sort_price_sale.dart';
import 'package:shop_app/drawer/drawer_screen.dart';
import 'package:shop_app/screens/home/components/products_grid.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
      child: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                height: 210,
                  color: Colors.black12,
                  child: Align(
                    alignment: Alignment(0, -0.2),
                    child: Text(
                      "Кроссовки и кеды",
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              SortPriceSale(),
            ],
          ),
          // SizedBox(height:20),
          ProductsGrid(key: productsGridGlobalKey), //key: futureGlobalKey
              // child: GridView.builder(
              //     itemCount: products.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       mainAxisSpacing: kDefaultPaddin,
              //       crossAxisSpacing: kDefaultPaddin,
              //       childAspectRatio: 0.75,
              //     ),
              //     itemBuilder: (context, index) => ItemCard(
              //           product: products[index],
              //           press: () => Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => DetailsScreen(
              //                   product: products[index],
              //                 ),
              //               )),
              //         )),

        ],
      ),
    );
  }
}
