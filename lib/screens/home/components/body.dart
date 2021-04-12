import 'package:flutter/material.dart';
import 'package:discount_app/constants.dart';
import 'package:discount_app/screens/home/components/sort_price_sale.dart';
import 'package:discount_app/drawer/drawer_screen.dart';
import 'package:discount_app/screens/home/components/products_grid.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size mainSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
      child: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                height: mainSize.height / 3.5,
                  child: Align(
                    alignment: Alignment(0, -0.2),
                    child: Text(
                      "Кроссовки и кеды",
                      style: TextStyle(
                        fontSize: defaultFontSize * 3,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              SortPriceSale(),
            ],
          ),
          ProductsGrid(key: productsGridGlobalKey),
        ],
      ),
    );
  }
}
