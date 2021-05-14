// import
// 'package:flutter/material.dart';
// import 'package:shop_app/screens/cart/cart_screen.dart';
//
// import '../../../size_config.dart';
// import 'icon_btn_with_counter.dart';
// import 'search_field.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_app/models/Cart.dart';
//
// class HomeHeader extends StatelessWidget {
//   const HomeHeader({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var len = Provider.of<CartModel>(context).products.length;
//     print('len: ' + len.toString());
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // SearchField(),
//           IconBtnWithCounter(
//             svgSrc: "assets/icons/Bell.svg",
//             numOfitem: 3,
//             press: () {},
//           ),
//           IconBtnWithCounter(
//             svgSrc: "assets/icons/Cart Icon.svg",
//             numOfitem: 2,
//             press: () => Navigator.pushNamed(context, CartScreen.routeName),
//           ),
//         ],
//       ),
//     );
//   }
// }
