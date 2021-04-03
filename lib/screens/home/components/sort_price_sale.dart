import 'package:flutter/material.dart';

// import '../../../constants.dart';

// We need satefull widget for our categories

bool isDownPrice = true;
bool isDownSale = true;

class SortPriceSale extends StatefulWidget {
  @override
  _SortPriceSaleState createState() => _SortPriceSaleState();
}

class _SortPriceSaleState extends State<SortPriceSale> {
  // List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  // int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      // color: Colors.deepOrange,
      child: Row(
        children: [
          Expanded(child: Text("Сортировка по:")),
          Expanded(child: priceSort()),
          Expanded(child: priceSale()),
        ],
      ),
    );
  }


  Widget priceSort() {


    return InkWell(
      onTap: () {
        setState(() {
          isDownPrice = !isDownPrice;

        });
      },
      child: Row(
        children: [
          Text("Цена"),
          Icon(isDownPrice ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up)
        ]
      ),
    );
  } 


  Widget priceSale() {


    return InkWell(
      onTap: () {
        setState(() {
          isDownSale = !isDownSale;

        });
      },
      child: Row(
        children: [
          Text("Скидка"),
          Icon(isDownSale ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up)
        ]
      ),
    );
  } 
}
//   Widget buildCategory(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               categories[index],
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: selectedIndex == index ? kTextColor : kTextLightColor,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
//               height: 2,
//               width: 30,
//               color: selectedIndex == index ? Colors.black : Colors.transparent,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
