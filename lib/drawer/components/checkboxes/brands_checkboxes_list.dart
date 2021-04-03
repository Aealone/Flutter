import 'package:flutter/material.dart';
import 'package:shop_app/drawer/components/drawer_info.dart';
import 'package:shop_app/drawer/components/checkboxes/checkbox_model.dart';
// import 'package:shop_app/http/http_service.dart';

final List<String> brandsListForRequest = [];

class BrandsCheckBoxList extends StatefulWidget {
  @override
  _BrandsCheckBoxListState createState() => _BrandsCheckBoxListState();
}

class _BrandsCheckBoxListState extends State<BrandsCheckBoxList> {



  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 300,
              child: ListView(
              children: brands.keys.map((String key) {
                return new LabeledCheckbox(
                  label: key,
                  values: brands[key],
                  onChanged: (bool value) {
                    setState(() {
                      // await HttpService().getPosts("adidas", "1000", "3000");
                      if (value == true) {
                        brandsListForRequest.add(key);
                      } else {
                        brandsListForRequest.remove(key);
                      }
                      brands[key] = value;
                    });
                  },
                );
              }).toList(),
          ),
        ),
      ],
    );
  }
}

