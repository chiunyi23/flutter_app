import 'package:flutter/material.dart';

import 'components/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登入"),
      ),
      body: Body(),
    );
  }
}
