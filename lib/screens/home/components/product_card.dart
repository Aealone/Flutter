import 'package:flutter/material.dart';
import 'package:discount_app/constants.dart';
import 'package:discount_app/http/request_model.dart';

class ProductCard extends StatelessWidget {
  final ProductInfo product;
  final Function press;

  const ProductCard({
    Key key,
    @required this.press,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String image = product.image[0];
    final String sizes = product.sizes.toString();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 3,
            blurRadius: 3,
          ),
        ],
      ),
      
      child: Column(
          children: <Widget>[

            Container(
              child: InkWell(
                child: Image.network("http://" + image, fit: BoxFit.fitWidth),
                  onTap: press,
              ),
            ),

            SizedBox(height: kDefaultPadding/2),

            Expanded(
              flex: 1,
                child: Text(
                product.brand,
                style: TextStyle(
                  fontSize: 17,
                  color: lightBlackTextColor,
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
                child: Text(
                  sizes.substring(1, sizes.length-1), 
                  style: TextStyle(
                    color: lightBlackTextColor,
                  ),),
              ),
              ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding/2, right: kDefaultPadding/2, bottom: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.oldPrice.toString() + "₽",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 18,
                          color: lightBlackTextColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Text(
                          product.newPrice.toString() + " ₽",
                          style: TextStyle(
                            fontSize: 25,
                            color: lightBlackTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}