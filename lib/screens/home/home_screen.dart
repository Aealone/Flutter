import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:discount_app/constants.dart';
import 'package:discount_app/screens/home/components/body.dart';
import 'package:discount_app/drawer/drawer_screen.dart';

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
              icon: SvgPicture.asset(
                'assets/icons/sliders.svg',
                color: Colors.white,
              ),
              label: Text("Фильтр"),
              backgroundColor: mainColor,
            ),
        ),
      ),
      body: Body(),
    );
  }
}