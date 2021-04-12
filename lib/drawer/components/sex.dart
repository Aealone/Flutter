import 'package:flutter/material.dart';
import 'package:discount_app/drawer/components/drawer_info.dart';

class SexRadio extends StatefulWidget {
  const SexRadio({Key key}) : super(key: key);

  @override
  _SexRadioState createState() => _SexRadioState();
}

class _SexRadioState extends State<SexRadio> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Мужской'),
          leading: Radio<bool>(
            value: sex["male"],
            groupValue: character,
            onChanged: (value) {
              setState(() {
                character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Женский'),
          leading: Radio<bool>(
            value: sex["female"],
            groupValue: character,
            onChanged: (value) {
              setState(() {
                character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
