import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/body.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           _scaffoldKey.currentState.openDrawer();
        },
        child: Text("Фильтр"),
        backgroundColor: Colors.green,
      ),
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}

  Drawer buildDrawer() {
    return Drawer(
      child: Center(
        child: ExpansionTile(
          title: Text("Размеры"),
          children: [
            MyCheckBox()
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

class MyCheckBox extends StatefulWidget {
  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {

  Map<String, bool> values = {
  '43': true,
  '44': false,
  };

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
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
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final userId;
  final id;
  final title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
//  Center(
//   child: FutureBuilder<Album>(
//     future: futureAlbum,
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         // print(Album.fromJson(jsonDecode(response.body));
//         return Text(snapshot.data.title);
//       } else if (snapshot.hasError) {
//         return Text("${snapshot.error}");
//       }

//       // By default, show a loading spinner.
//       return CircularProgressIndicator();
//     },
//   ),
// ),


