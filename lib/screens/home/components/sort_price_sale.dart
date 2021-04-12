import 'package:flutter/material.dart';
import 'package:discount_app/screens/home/components/products_grid.dart';
import 'package:discount_app/constants.dart';

bool isDownPrice = true;
bool isDownSale = true;

final GlobalKey<GridState> gridGlobalKey = new GlobalKey<GridState>();

class SortPriceSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size mainSize = MediaQuery.of(context).size;
    return Container(
      height: mainSize.height/20,
      child: Row(
        children: [
          Expanded(child: Text("Сортировка по:", style: TextStyle(fontSize: defaultFontSize, color: defaultTextColor))),
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
      child: Row(
        children: [
          Text("Цена", style: TextStyle(fontSize: defaultFontSize, color: defaultTextColor)),
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
          Text("Скидка", style: TextStyle(fontSize: defaultFontSize, color: defaultTextColor)),
          Icon(myIcon)
        ]
      ),
    );
  } 
}