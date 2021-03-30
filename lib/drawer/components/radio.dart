import 'package:flutter/material.dart';
import 'package:shop_app/drawer/components/drawer_info.dart';



/// This is the stateful widget that the main application instantiates.
class SexRadio extends StatefulWidget {
  const SexRadio({Key key}) : super(key: key);

  @override
  _SexRadioState createState() => _SexRadioState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SexRadioState extends State<SexRadio> {
  // Map<String, bool> _character = sex;
  bool _character = sex["male"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Мужской'),
          leading: Radio<bool>(
            value: sex["male"],
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                // value = _character;
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Женский'),
          leading: Radio<bool>(
            value: sex["female"],
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                // value = _character;
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
