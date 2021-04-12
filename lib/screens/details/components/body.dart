import 'package:flutter/material.dart';
import 'package:discount_app/http/request_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:discount_app/constants.dart';

class Body extends StatelessWidget {
  final ProductInfo product;
  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String image = product.image[0];
    // Size mainSize = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [

            // image
            Container(
              height: 420,
              child: Image.network("http://" + image, fit: BoxFit.fill),
            ),

            // brand
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: Align(
                alignment: Alignment.center,
                child: Text(product.brand,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // sizes
            Container(
              // color: Colors.red,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center, 
                    child: const Text("Размеры: ",
                      style: TextStyle(
                        fontSize: defaultFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  SizedBox(height: kDefaultPadding/2),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      product.sizes.toString().substring(1, product.sizes.toString().length-1),
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: defaultFontSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // oldprice
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding*2),
              child: Container(
                // color: Colors.green,
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(product.oldPrice.toString() + " ₽",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 18,
                            color: lightBlackTextColor,
                          ),
                        ),
                      ),
                    ),

                    // newprice
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(product.newPrice.toString() + " ₽",
                          style: TextStyle(
                            fontSize: 25,
                            color: lightBlackTextColor,
                          ),
                        ),
                      ),
                    ),

                    // buy
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          color: mainColor,
                          onPressed: () => launch(product.mainLink),
                          child: const Text("Купить", style: TextStyle(color: Colors.white))
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),            
          ],
        ),
      ),
    );
  }
}