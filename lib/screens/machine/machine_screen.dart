import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';

import '../../enums.dart';
import 'components/body.dart';

class MachineScreen extends StatelessWidget {
  static String routeName = "/machine";
  @override
  Widget build(BuildContext context) {
    dynamic parameters = ModalRoute.of(context).settings.arguments;
    String id = parameters['id'];
    return Scaffold(
      body: Body(id: id),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}