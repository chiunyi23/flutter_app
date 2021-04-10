import 'package:flutter/material.dart';

import 'components/body.dart';

class ScanScreen extends StatelessWidget {
  static String routeName = "/scan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
