import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Account.dart';

class Body extends StatelessWidget {

  Future<bool> _confirm(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('確定登出 ？'),
          content: SingleChildScrollView(
            // child: ListBody(
            //   children: <Widget>[
            //     Text(
            //       '總計：',
            //       style: TextStyle(fontSize: 20),
            //       textAlign: TextAlign.left,
            //     ),
            //     Text(
            //       totalPrice.toString(),
            //       style: TextStyle(fontSize: 35),
            //       textAlign: TextAlign.left,
            //     ),
            //     Text(
            //       '扣款後餘額：',
            //       style: TextStyle(fontSize: 20),
            //       textAlign: TextAlign.left,
            //     ),
            //     Text(
            //       (balance - totalPrice).toString(),
            //       style: TextStyle(fontSize: 35),
            //       textAlign: TextAlign.left,
            //     ),
            //   ],
            // ),
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
              onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  await prefs.setString('user', '');
                  await prefs.setString('password', '');
                  Navigator.pushReplacementNamed(context, SplashScreen.routeName);
                },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AccountModel>(context);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: user.firstName,
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "餘額： " + user.balance.toString(),
            icon: "assets/icons/Cash.svg",
            press: () => {},
          ),
          // ProfileMenu(
          //   text: "通知",
          //   icon: "assets/icons/Bell.svg",
          //   press: () {},
          // ),
          // ProfileMenu(
          //   text: "設定",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          // ProfileMenu(
          //   text: "FAQ",
          //   icon: "assets/icons/Question mark.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "登出",
            icon: "assets/icons/Log out.svg",
            press: () async {
              _confirm(context);
            },
          ),
        ],
      ),
    );
  }
}
