import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/map/map_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Account.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountModel>(context);
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "取貨成功",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 30,),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: '完成',
            press: () {
              Navigator.pushNamed(context, MapScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
