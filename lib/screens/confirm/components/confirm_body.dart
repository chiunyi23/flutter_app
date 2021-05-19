import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shop_app/models/Account.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/map/map_screen.dart';
import 'package:shop_app/screens/splash/components/splash_content.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final LocalAuthentication auth = LocalAuthentication();
  // bool _canCheckBiometrics;
  // List<BiometricType> _availableBiometrics;
  String _authorized = '未驗證';
  bool _isAuthenticating = false;

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = '驗證中';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? '通過' : '未通過';
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    if(_authorized == '未驗證') {
      _authenticate();
    }
    if(_authorized == '未通過') {
      Navigator.pop(context);
    }

    var cart = Provider.of<CartModel>(context);
    var user = Provider.of<AccountModel>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 100,),
                    Text(
                      '請使用 NFC 感應取貨',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(36),
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 100,),
                    SvgPicture.asset('assets/images/NFC-Icon.svg', color: Colors.deepOrangeAccent, width: 300,),
                    // SvgPicture.asset("assets/icons/Heart Icon.svg")
                    // Image.asset('assets/images/nfc-anim-lg.gif'),
                    // SplashContent(image: 'assets/images/success.png', text: '使用 NFC 感應'),
                    // Text('$_authorized\n'),
                    // ElevatedButton(
                    //   child: Text(_isAuthenticating ? '取消' : '驗證'),
                    //   onPressed:
                    //   _isAuthenticating ? _cancelAuthentication : _authenticate,
                    // ),
                    ElevatedButton(
                        onPressed: () => {
                          for(var index = 0; index < cart.products.length; index++) {
                            user.addHistory(cart.products[index]),
                          },
                          cart.clearCart(),
                          Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName)
                        },
                        child: Text('OK')),
                  ])),
        ));
  }
}

// enum _SupportState {
//   unknown,
//   supported,
//   unsupported,
// }