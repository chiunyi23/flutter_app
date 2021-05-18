import 'package:flutter/material.dart';

import 'components/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("註冊"),
      ),
      body: Body(),
    );
  }
}
