import 'package:flutter/material.dart';
// import 'package:shop_app/constants.dart';
import '../../../http/request_model.dart';
import 'package:url_launcher/url_launcher.dart';


// import 'add_to_cart.dart';
// import 'color_and_size.dart';
// import 'counter_with_fav_btn.dart';
// import 'description.dart';
// import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final ProductInfo product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = product.image.toString();
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            // height: size.height*0.8,
            width: size.width,
            // color: Colors.green,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.network("http://" + image.substring(1, image.length-1), fit: BoxFit.fitWidth)),
          ),

          // category 
          Container(
            width: size.width,
            // color: Colors.green,
            child: Align(
              alignment: Alignment.center,
              child: Text(product.category),
            ),
          ),

          // brand
          Container(
            width: size.width,
            // color: Colors.green,
            child: Align(
              alignment: Alignment.center,
              child: Text(product.brand),
            ),
          ),

          // color
          Container(
            width: size.width,
            // color: Colors.green,
            child: Align(
              alignment: Alignment.center,
              child: Text(product.color),
            ),
          ),

          // oldprice
          Container(
            width: size.width,
            // color: Colors.green,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(product.oldPrice.toString()),
            ),
          ),

          // newprice
          Container(
            width: size.width,
            // color: Colors.green,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(product.newPrice.toString()),
            ),
          ),

          // newprice
          Container(
            width: size.width,
            // color: Colors.green,
            child: Align(
              alignment: Alignment.center,
              child: new InkWell(
                // splashColor: Colors.green,
                child: new Text('Купить'),
                  onTap: () => launch(product.mainLink),
             ),
            ),
          ),
        ],
      ),
    );
  }
}
