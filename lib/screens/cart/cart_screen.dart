import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    var len = cart.products.length;

    return AppBar(
      title: Column(
        children: [
          Text(
            "購物車",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            len.toString(),
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
