import 'package:flutter/material.dart';
import 'package:discount_app/constants.dart';

class LabeledCheckbox extends StatelessWidget {
  LabeledCheckbox({
    this.label,
    this.values,
    this.onChanged,
  });

  final label;
  final bool values;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!values);
      },
      child: Row(
        children: <Widget>[
          Expanded(child: Text(label)),
          Checkbox(
            activeColor: mainColor,
            value: values,
            onChanged: (bool newValue) {
              onChanged(newValue);
            },
          ),
        ],
      ),
    );
  }
}
