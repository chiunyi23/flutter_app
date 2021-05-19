import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/models/Cart.dart';

import 'package:provider/provider.dart';
import '../../enums.dart';
import 'components/rating_body.dart';

class RatingScreen extends StatelessWidget {
  static String routeName = "/rating";

  @override
  Widget build(BuildContext context) {
    // dynamic parameters = ModalRoute.of(context).settings.arguments;
    // String id = parameters['id'];
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "購買記錄",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
