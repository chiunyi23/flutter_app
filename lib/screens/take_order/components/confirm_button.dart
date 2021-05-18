import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Account.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/machine/machine_screen.dart';
import 'package:shop_app/screens/map/map_screen.dart';
import 'package:shop_app/screens/take_order/take_order_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../confirm/confirm_screen.dart';
import 'package:provider/provider.dart';


class ConfirmButton extends StatelessWidget {

  final int price;
  const ConfirmButton({
    Key key, @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    var user = Provider.of<AccountModel>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(120),
                  child: DefaultButton(
                    text: "取消",
                    press: () {
                      user.setBalanceInt(user.balance + price);
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(120),
                  child: DefaultButton(
                    text: "驗證取貨",
                    press: () {
                      Navigator.pushReplacementNamed(context, ConfirmScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
