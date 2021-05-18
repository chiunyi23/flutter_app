import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/confirm/confirm_screen.dart';
import 'package:shop_app/screens/map/map_screen.dart';
import 'package:shop_app/screens/scan/scan_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/controllers/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Account.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Let’s drink!", "image": "assets/images/beers.png"},
    {"text": "選定離你最近的販賣機與飲料", "image": "assets/images/splash_2.png"},
    {"text": "透過 NFC 支付，省去掏零錢的困擾", "image": "assets/images/splash_3.png"},
  ];

  Future<String> checkLogin() async {
    var prefs = await SharedPreferences.getInstance();
    print('in splash++');
    final user = prefs.get('user');
    final password = prefs.getString('password');

    print(user);
    print(password);

    final isValid = await Signin(user, password);
    Map<String, dynamic> accountInfo = jsonDecode(isValid)[0];
    if(isValid == 'Timeout') {
      await Fluttertoast.showToast(msg: '無法連接伺服器');
      return 'false';
    }
    else if(isValid == 'INVALID') {
      return 'false';
    }
    else {
      print('valid');
      // await Fluttertoast.showToast(msg: '歡迎回來');
      return accountInfo['balance'].toString();
    }

  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
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

    var user = Provider.of<AccountModel>(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "開始使用",
                      press: () async{

                        String valid = await checkLogin();
                        if(valid == 'false') {
                          print('not valid in splash');
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        }
                        else {
                          print('valid in splash');
                          user.setBalance(valid);
                          Navigator.pushNamed(context, MapScreen.routeName);
                        }
                          // Navigator.pushNamed(context, MapScreen.routeName);
                        // Navigator.pushNamed(context, ScanScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
