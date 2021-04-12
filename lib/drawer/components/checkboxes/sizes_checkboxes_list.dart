import 'package:flutter/material.dart';
import 'package:discount_app/drawer/components/drawer_info.dart';
import 'package:discount_app/drawer/components/checkboxes/checkbox_model.dart';

final List<String> sizesListForRequest = [];

class SizesCheckBoxList extends StatefulWidget {
  @override
  _SizesCheckBoxListState createState() => _SizesCheckBoxListState();
}

class _SizesCheckBoxListState extends State<SizesCheckBoxList> {
  @override
  Widget build(BuildContext context) {
    Size mainSize = MediaQuery.of(context).size;
    return  Column(
      children: [
        SizedBox(
          height: mainSize.height/3,
              child: ListView(
              children: sizesUniq.keys.map((String key) {
                return new LabeledCheckbox(
                  label: key,
                  values: sizesUniq[key],
                  onChanged: (bool value) {
                    setState(() {
                      if (value == true) {
                        sizesListForRequest.add(key);
                      } else {
                        sizesListForRequest.remove(key);
                      }
                      sizesUniq[key] = value;
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