import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "個人資料",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "通知",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "設定",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "FAQ",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "登出",
            icon: "assets/icons/Log out.svg",
            press: () async {
              var prefs = await SharedPreferences.getInstance();
              await prefs.setString('user', '');
              await prefs.setString('password', '');
            },
          ),
        ],
      ),
    );
  }
}
