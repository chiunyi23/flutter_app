

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:shop_app/screens/take_order/components/body.dart';
import 'package:flutter/material.dart';

class TakeOrderScreen extends StatelessWidget {
  static String routeName = 'takeorder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

}