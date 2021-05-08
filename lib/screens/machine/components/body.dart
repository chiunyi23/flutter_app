import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/popular_product.dart';
import '../../../size_config.dart';
import '../components/home_header.dart';

class Body extends StatelessWidget {
  final String id;

  // ignore: sort_constructors_first
  Body({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(id: id,),
            SizedBox(height: getProportionateScreenWidth(10)),
            // DiscountBanner(),
            // Categories(),
            // SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(id: id,),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}