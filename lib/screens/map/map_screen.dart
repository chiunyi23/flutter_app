import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/map_body.dart';


class MapScreen extends StatelessWidget {
  static String routeName = 'map';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.map),
    );
  }
}
