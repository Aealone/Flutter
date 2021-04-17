import 'package:flutter/material.dart';
import 'package:discount_app/drawer/components/checkboxes/brands_checkboxes_list.dart';
import 'package:discount_app/drawer/components/checkboxes/sizes_checkboxes_list.dart';
// import 'package:discount_app/drawer/components/sex.dart';
import 'package:discount_app/screens/home/components/products_grid.dart';
import 'package:discount_app/constants.dart';
import 'package:flutter/services.dart';

GlobalKey<ProductsGridState> productsGridGlobalKey = GlobalKey<ProductsGridState>();

Drawer buildDrawer() {
  

  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();

  return Drawer(
    child: Theme(
      data: ThemeData.light().copyWith(accentColor: mainColor, primaryColor: mainColor, cursorColor: mainColor),
          child: Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding/2, right: kDefaultPadding/2, top: 25.0),
        child: ListView(
          children:[

            // Text("Пол"),
            // SexRadio(),

            ExpansionTile(
              tilePadding: EdgeInsets.only(left: -kDefaultPadding),
              title: Text("Бренд",
              style: TextStyle(
                fontSize: defaultFontSize,
                fontWeight: FontWeight.w500,
                color: lightBlackTextColor,
              ),),
              children: [
                BrandsCheckBoxList()
              ],
            ),

            ExpansionTile(
              tilePadding: EdgeInsets.only(left: -kDefaultPadding),
              title: Text("Размер",
                style: TextStyle(
                fontSize: defaultFontSize,
                fontWeight: FontWeight.w500,
                color: lightBlackTextColor,
              ),),
              children: [
                SizesCheckBoxList()
              ],
            ),

            Text("Цена",
              style: TextStyle(
                fontSize: defaultFontSize,
                fontWeight: FontWeight.w500,
                color: lightBlackTextColor,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding),
              child: SizedBox(
                height: 35,
                child: Row(
                  children:[

                    // minPrice
                    Expanded(
                      flex: 3,
                      child: TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: minPriceController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'min'
                        ),
                      ),
                    ),

                    Expanded(child: SizedBox(),),

                    // maxPrice
                    Expanded(
                      flex: 3,
                      child: TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: maxPriceController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'max'
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              color: mainColor,
              onPressed: () {
                final String brandsStringForRequest = brandsListForRequest.toString().substring(1, brandsListForRequest.toString().length-1).replaceAll(', ', ',');
                // final String sizesStringForRequest = sizesListForRequest.toString().substring(1, sizesListForRequest.toString().length-1).replaceAll(', ', ',');
                productsGridGlobalKey.currentState.updateProductsGrid(brandsStringForRequest, minPriceController.text, maxPriceController.text);
              },
              child: Text("Применить", style: TextStyle(color: Colors.white))
            )
            
          ],
        ),
      ),
    ),
  );

} 