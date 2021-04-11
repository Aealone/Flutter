import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/products_grid.dart';

// import '../../../constants.dart';

// We need satefull widget for our categories

bool isDownPrice = true;
bool isDownSale = true;

final GlobalKey<GridState> gridGlobalKey = new GlobalKey<GridState>();


// class SortPriceSale extends StatefulWidget {
//   @override
//   _SortPriceSaleState createState() => _SortPriceSaleState();
// }

// class _SortPriceSaleState extends State<SortPriceSale> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 30,
//       // color: Colors.deepOrange,
//       child: Row(
//         children: [
//           Expanded(child: Text("Сортировка по:")),
//           Expanded(child: priceSort()),
//           Expanded(child: priceSale()),
//         ],
//       ),
//     );
//   }

class SortPriceSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      // color: Colors.deepOrange,
      child: Row(
        children: [
          Expanded(child: Text("Сортировка по:")),
          Expanded(child: PriceofSort()),
          Expanded(child: SaleofSort()),
        ],
      ),
    );
  }
}

class PriceofSort extends StatefulWidget {
  @override
  _PriceofSortState createState() => _PriceofSortState();
}

class _PriceofSortState extends State<PriceofSort> {
  IconData myIcon;

  void initState() {
    myIcon = Icons.remove;
    super.initState();
  }

  void sortAndUpdateIcon() {
    setState(() {
      if(isDownPrice) {
        myIcon = Icons.keyboard_arrow_down;
        productsList.sort((end, start) {
          return start.newPrice.compareTo(end.newPrice);
        });
      } else {
        myIcon = Icons.keyboard_arrow_up;
        productsList.sort((start, end) {
          return start.newPrice.compareTo(end.newPrice);
        });
      }
          
      isDownPrice = !isDownPrice;
      gridGlobalKey.currentState.updateGrid(productsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => sortAndUpdateIcon(),
      // isDownPrice ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up
      child: Row(
        children: [
          Text("Цена"),
          Icon(myIcon),
        ]
      ),
    );
  }
}


class SaleofSort extends StatefulWidget {
  @override
  _SaleofSortState createState() => _SaleofSortState();
}

class _SaleofSortState extends State<SaleofSort> {
  IconData myIcon;


  void initState() {
    myIcon = Icons.remove;
    super.initState();
  }

  void sortAndUpdateIcon() {
    setState(() {
      if(isDownPrice) {
        myIcon = Icons.keyboard_arrow_down;
        productsList.sort((start, end) {
            return (100/(start.oldPrice/start.newPrice)).compareTo(100/(end.oldPrice/end.newPrice));
          });
      } else {
        myIcon = Icons.keyboard_arrow_up;
        productsList.sort((end, start) {
            return (100/(start.oldPrice/start.newPrice)).compareTo(100/(end.oldPrice/end.newPrice));
          });
      }
          
      isDownPrice = !isDownPrice;
      gridGlobalKey.currentState.updateGrid(productsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => sortAndUpdateIcon(),
      child: Row(
        children: [
          Text("Скидка"),
          Icon(myIcon)
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
