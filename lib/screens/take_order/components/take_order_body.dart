import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/cart/components/cart_card.dart';

import 'package:shop_app/screens/take_order/components/ordered_item.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/take_order/components/timer.dart';

class Body extends StatelessWidget {
  final String id;
  Body({Key key, @required this.id}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            // HomeHeader(id: id,),
            SizedBox(height: getProportionateScreenWidth(10)),
            OrderedItem(id: id,),
            SizedBox(height: getProportionateScreenWidth(30)),
            TimerSection(),
          ],
        ),
      ),
    );
  }
}