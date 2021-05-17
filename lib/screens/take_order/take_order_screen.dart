import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/take_order/components/take_order_body.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/take_order/components/confirm_button.dart';

class TakeOrderScreen extends StatelessWidget {
  static String routeName = 'takeorder';

  @override
  Widget build(BuildContext context) {
    dynamic parameters = ModalRoute.of(context).settings.arguments;
    String id = parameters['id'];
    return Scaffold(
      body: Body(id: id),
      bottomNavigationBar: ConfirmButton(),
    );
  }

}