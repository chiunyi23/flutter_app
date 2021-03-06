import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';

import 'components/cart_body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    dynamic parameters = ModalRoute.of(context).settings.arguments;
    String id = parameters['id'];
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(id: id),
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
