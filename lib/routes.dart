import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/confirm/confirm_screen.dart';
import 'package:shop_app/screens/machine/machine_screen.dart';
import 'package:shop_app/screens/take_order/take_order_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';
import 'screens/map/map_screen.dart';
import 'screens/scan/scan_screen.dart';
import 'screens/rating/rating_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  MapScreen.routeName: (context) => MapScreen(),
  ConfirmScreen.routeName: (context) => ConfirmScreen(),
  MachineScreen.routeName: (context) => MachineScreen(),
  ScanScreen.routeName: (context) => ScanScreen(),
  TakeOrderScreen.routeName: (context) => TakeOrderScreen(),
  RatingScreen.routeName: (context) => RatingScreen(),
};
