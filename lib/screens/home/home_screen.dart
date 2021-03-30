import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/body.dart';
// import 'package:shop_app/http_post.dart';
import '../../drawer/drawer_screen.dart';

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
              backgroundColor: mainColor,
            ),
        ),
      ),
      // appBar: buildAppBar(),
      body: Body(),
    );
  }
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


