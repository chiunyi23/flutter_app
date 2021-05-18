import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Account.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/take_order/take_order_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../confirm/confirm_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';

class CheckoutCard extends StatefulWidget {
  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {

  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = '未驗證';
  bool _isAuthenticating = false;

  Future<void> _authenticate() async {
    bool authenticated = false;
    try{
      setState(() {
        _isAuthenticating = true;
        _authorized = '驗證中';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: '請掃描指紋進行身份驗證',
          useErrorDialogs: true,
          stickyAuth: true,
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = '完成';
      });
    } on PlatformException catch (e) {
      print(e);
    }

    final String message = authenticated? '通過': '未通過';
    setState(() {
      _authorized = message;
    });

  }


  Future<bool> _showMyDialog(BuildContext context, int balance, int totalPrice, String id, var user) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('確定付款'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text(
                //   '扣款前： ' + balance.toString(),
                //   style: TextStyle(fontSize: 35),
                //   textAlign: TextAlign.right,
                // ),
                Text(
                  '總計：',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                Text(
                  totalPrice.toString(),
                  style: TextStyle(fontSize: 35),
                  textAlign: TextAlign.left,
                ),
                Text(
                  '扣款後餘額：',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                Text(
                  (balance - totalPrice).toString(),
                  style: TextStyle(fontSize: 35),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('確定'),
              onPressed: () async{
                await _authenticate();
                if(_authorized == '通過') {
                  user.setBalanceInt(balance - totalPrice);
                  Navigator.pushReplacementNamed(context, TakeOrderScreen.routeName, arguments: {'id': id, 'price': totalPrice});
                }
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    dynamic parameters = ModalRoute.of(context).settings.arguments;
    String id = parameters['id'];

    var cart = Provider.of<CartModel>(context);
    final totalPrice = cart.totalPrice();

    var user = Provider.of<AccountModel>(context);
    final balance = user.balance;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
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
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("當前餘額：" + balance.toString()),
                const SizedBox(width: 10),
                // Icon(
                //   Icons.arrow_forward_ios,
                //   size: 12,
                //   color: kTextColor,
                // )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "總計:\n",
                    children: [
                      TextSpan(
                        text: totalPrice.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "確認",
                    press: () async {
                      if(totalPrice > balance) {
                        Fluttertoast.showToast(msg: '餘額不足');
                      }
                      else {
                        await _showMyDialog(context, balance, totalPrice, id, user);

                      }
                      // Navigator.pushNamed(context, TakeOrderScreen.routeName, arguments: {'id': id});
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