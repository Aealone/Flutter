import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/body.dart';
// import 'package:shop_app/http_post.dart';

// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(),
      floatingActionButton: Container(
        child: Align(
          alignment: Alignment(-0.8, -0.5),
            child: FloatingActionButton.extended(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              icon: Icon(Icons.settings_applications),
              label: Text("Фильтр"),
              backgroundColor: Colors.red,
            ),
        ),
      ),
      // appBar: buildAppBar(),
      body: Body(),
    );
  }

  // AppBar buildAppBar() {
  //   return AppBar(
  //     backgroundColor: Colors.white,
  //     elevation: 0,
  //     leading: IconButton(
  //       icon: SvgPicture.asset("assets/icons/back.svg"),
  //       onPressed: () {},
  //     ),
  //     actions: <Widget>[
  //       IconButton(
  //         icon: SvgPicture.asset(
  //           "assets/icons/search.svg",
  //           // By default our  icon color is white
  //           color: kTextColor,
  //         ),
  //         onPressed: () {},
  //       ),
  //       IconButton(
  //         icon: SvgPicture.asset(
  //           "assets/icons/cart.svg",
  //           // By default our  icon color is white
  //           color: kTextColor,
  //         ),
  //         onPressed: () {},
  //       ),
  //       SizedBox(width: kDefaultPaddin / 2)
  //     ],
  //   );
  // }
}

  Drawer buildDrawer() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0),
        child: Column(
          children:[
            Text("Пол"),

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
          ],
        ),
      ),
    );
  } 

class LabeledCheckbox extends StatelessWidget {
  LabeledCheckbox({
    this.label,
    this.value,
    this.onChanged,
  });

  final label;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: <Widget>[
          Expanded(child: Text(label)),
          Checkbox(
            value: value,
            onChanged: (bool newValue) {
              onChanged(newValue);
            },
          ),
        ],
      ),
    );
  }
}

class BrandsCheckBoxList extends StatefulWidget {
  @override
  _BrandsCheckBoxListState createState() => _BrandsCheckBoxListState();
}

class _BrandsCheckBoxListState extends State<BrandsCheckBoxList> {

  Map<String, bool> values = {
  'Adidas': true,
  'Nike': false,
  };

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 300,
              child: ListView(
              children: values.keys.map((String key) {
                return new LabeledCheckbox(
                  label: key,
                  value: values[key],
                  onChanged: (bool value) {
                    setState(() {
                      values[key] = value;
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

class SizesCheckBoxList extends StatefulWidget {
  @override
  _SizesCheckBoxListState createState() => _SizesCheckBoxListState();
}

class _SizesCheckBoxListState extends State<SizesCheckBoxList> {

  Map<String, bool> values = {
  '43': true,
  '44': false,
  };

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 200,
              child: ListView(
              children: values.keys.map((String key) {
                return new LabeledCheckbox(
                  label: key,
                  value: values[key],
                  onChanged: (bool value) {
                    setState(() {
                      values[key] = value;
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


