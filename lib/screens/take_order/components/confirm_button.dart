import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Account.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_app/screens/machine/machine_screen.dart';
import 'package:shop_app/screens/map/map_screen.dart';
import 'package:shop_app/screens/take_order/take_order_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../confirm/confirm_screen.dart';
import 'package:provider/provider.dart';


class ConfirmButton extends StatefulWidget {
  final int price;
  const ConfirmButton({
    Key key, @required this.price,
  }) : super(key: key);
  @override
  _ConfirmButtonState createState() =>  _ConfirmButtonState();

}
class _ConfirmButtonState extends State<ConfirmButton> {
  bool isCancel = false;

  Future<void> _confirm(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('確定取消 ？'),
          actions: <Widget>[
            TextButton(
              child: Text('留在此頁'),
              onPressed: () {
                setState(() {
                  isCancel = false;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('確定'),
              onPressed: () async {
                setState(() {
                  isCancel = true;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                    press: () async {
                      await _confirm(context);
                      print('isCancel: ' + isCancel.toString());
                      if(isCancel) {
                        user.setBalanceInt(user.balance + widget.price);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(120),
                  child: DefaultButton(
                    text: "驗證取貨",
                    press: () {
                      Navigator.pushNamed(context, ConfirmScreen.routeName);
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
