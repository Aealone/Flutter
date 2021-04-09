import 'package:flutter/material.dart';
import 'package:shop_app/drawer/components/checkboxes/brands_checkboxes_list.dart';
import 'package:shop_app/drawer/components/checkboxes/sizes_checkboxes_list.dart';

import 'package:shop_app/http/http_service.dart';

import 'package:shop_app/drawer/components/radio.dart';
import 'package:shop_app/screens/home/components/products_grid.dart';


final GlobalKey<ProductsGridState> futureGlobalKey = new GlobalKey<ProductsGridState>();

//  void _doFilter() {
//     futureGlobalKey.currentState.updateGrid(HttpService().getPosts("adidas", "1000", "3000"));
//   }

  Drawer buildDrawer() {

    final minPriceController = TextEditingController();
    final maxPriceController = TextEditingController();
    
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0),
        child: ListView(
          children:[

            Text("Пол"),
            SexRadio(),

            ExpansionTile(
            title: Text("Бренд"),
            children: [
              BrandsCheckBoxList()
            ],
            ),

            ExpansionTile(
            title: Text("Размер"),
            children: [
              SizesCheckBoxList()
            ],
            ),
            Text("Цена"),
            SizedBox(
              height: 30,
              child: Row(
                children:[

                  // minPrice
                  Expanded(
                    child: TextField(
                      controller: minPriceController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'min'
                      ),
                    ),
                  ),

                  Expanded(child: SizedBox(width: 80,),),

                  // maxPrice
                  Expanded(
                    child: TextField(
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
            ElevatedButton(
              onPressed: () {
                // если бренд имеет нескольк ослов в названии то пробелы удаляются и ерунда выходит
                final String brandsStringForRequest = brandsListForRequest.toString().substring(1, brandsListForRequest.toString().length-1).replaceAll(' ', '');
                // final String sizesStringForRequest = sizesListForRequest.toString().substring(1, sizesListForRequest.toString().length-1).replaceAll(' ', '');
                futureGlobalKey.currentState.updateGrid(HttpService().getPosts(brandsStringForRequest, minPriceController.text, maxPriceController.text));
              },
              child: Text("Применить"))
            
          ],
        ),
      ),
    );
 
  } 