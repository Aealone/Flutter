import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:discount_app/constants.dart';
import 'package:discount_app/http/request_model.dart';
import 'package:discount_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final ProductInfo product;
  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(product.category),
      backgroundColor: mainColor,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      
    );
  }
}
