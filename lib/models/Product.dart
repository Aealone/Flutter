import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class ProductCard extends StatelessWidget {
  final String image, category, brand, color, mainLink;
  final int oldPrice, newPrice;
  final String sizes;

  ProductCard({
    @required this.sizes,
    this.image,
    this.category,
    @required this.brand,
    this.color,
    @required this.oldPrice,
    @required this.newPrice,
    this.mainLink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      color: Colors.black54,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(height:245, child: Image.network(image, fit: BoxFit.contain)),
          Text(
            brand,
            style: TextStyle(
              fontSize: brandFontSize,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),),
          Text(sizes.substring(1, sizes.length-1)),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  oldPrice.toString(),
                  style: TextStyle(
                    fontSize: oldPriceFontSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                ),
              Expanded(
                flex: 1,
                child: Text(
                  newPrice.toString(),
                  style: TextStyle(
                    fontSize: newPriceFontSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                  ),
                ),
            ],
          ),

        ],
      ),
    );
  }
}

// List<Product> products = [
//   Product(
//       id: 1,
//       title: "Office Code",
//       price: 234,
//       size: 12,
//       description: dummyText,
//       image: "assets/images/first_sneaker.jpg",
//       color: Color(0xFF3D82AE)),
//   Product(
//       id: 2,
//       title: "Belt Bag",
//       price: 234,
//       size: 8,
//       description: dummyText,
//       image: "assets/images/second_sneaker.jpg",
//       color: Color(0xFFD3A984)),
//   Product(
//       id: 3,
//       title: "Hang Top",
//       price: 234,
//       size: 10,
//       description: dummyText,
//       image: "assets/images/third_sneaker.jpg",
//       color: Color(0xFF989493)),
//   Product(
//       id: 4,
//       title: "Old Fashion",
//       price: 234,
//       size: 11,
//       description: dummyText,
//       image: "assets/images/fourth_sneaker.jpg",
//       color: Color(0xFFE6B398)),
//   Product(
//       id: 5,
//       title: "Office Code",
//       price: 234,
//       size: 12,
//       description: dummyText,
//       image: "assets/images/bag_5.png",
//       color: Color(0xFFFB7883)),
//   Product(
//     id: 6,
//     title: "Office Code",
//     price: 234,
//     size: 12,
//     description: dummyText,
//     image: "assets/images/bag_6.png",
//     color: Color(0xFFAEAEAE),
//   ),
// ];

// String dummyText =
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";