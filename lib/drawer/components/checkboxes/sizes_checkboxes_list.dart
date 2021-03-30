import 'package:flutter/material.dart';
import 'package:shop_app/drawer/components/drawer_info.dart';
import 'package:shop_app/drawer/components/checkboxes/checkbox_model.dart';

class SizesCheckBoxList extends StatefulWidget {
  @override
  _SizesCheckBoxListState createState() => _SizesCheckBoxListState();
}

class _SizesCheckBoxListState extends State<SizesCheckBoxList> {



  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 200,
              child: ListView(
              children: sizes.keys.map((String key) {
                return new LabeledCheckbox(
                  label: key,
                  values: sizes[key],
                  onChanged: (bool value) {
                    setState(() {
                      sizes[key] = value;
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