import 'package:flutter/material.dart';
import 'package:discount_app/drawer/components/drawer_info.dart';
import 'package:discount_app/drawer/components/checkboxes/checkbox_model.dart';

final List<String> brandsListForRequest = [];

class BrandsCheckBoxList extends StatefulWidget {
  @override
  _BrandsCheckBoxListState createState() => _BrandsCheckBoxListState();
}

class _BrandsCheckBoxListState extends State<BrandsCheckBoxList> {
  @override
  Widget build(BuildContext context) {
    Size mainSize = MediaQuery.of(context).size;
    return  Column(
      children: [
        SizedBox(
          height: mainSize.height/2.5,
              child: ListView(
              children: brandsUniq.keys.map((String key) {
                return new LabeledCheckbox(
                  label: key,
                  values: brandsUniq[key],
                  onChanged: (bool value) {
                    setState(() {
                      if (value == true) {
                        brandsListForRequest.add(key);
                      } else {
                        brandsListForRequest.remove(key);
                      }
                      brandsUniq[key] = value;
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

