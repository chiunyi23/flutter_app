import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';

class HomeHeader extends StatelessWidget {
  final String id;
  // ignore: sort_constructors_first
  const HomeHeader({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var len = Provider.of<CartModel>(context).products.length;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SearchField(),
          // Text('No. '+ id),
          Text('理工二館一樓', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: len,
            press: () => Navigator.pushNamed(context, CartScreen.routeName, arguments: {'id': id}),
          ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
