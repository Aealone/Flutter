import 'package:flutter/material.dart';

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
