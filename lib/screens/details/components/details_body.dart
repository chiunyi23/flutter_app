import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        // Card(
        //   elevation: 15.0,
        //   margin: EdgeInsets.only(left: getProportionateScreenWidth(10), right: getProportionateScreenWidth(10)),
        //
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        //   child: SizedBox(height: 50,),
        // ),
        SizedBox(height: 30,),
        Card(
          elevation: 5.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.all(getProportionateScreenWidth(10), ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              SizedBox(height: 20,)
            ],
          )
        ),
        TopRoundedContainer(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.15,
              right: SizeConfig.screenWidth * 0.15,
              bottom: getProportionateScreenWidth(40),
              top: getProportionateScreenWidth(15),
            ),
            child: DefaultButton(
              text: '放入購物車',
              press: () {
                var cart = context.read<CartModel>();
                cart.add(product);
              },
            ),
          ),
        ),

        // TopRoundedContainer(
        //   color: Colors.white,
        //   child: Column(
        //     children: [
        //       ProductDescription(
        //         product: product,
        //         pressOnSeeMore: () {},
        //       ),
        //       // TopRoundedContainer(
        //       //   color: Color(0xFFF6F7F9),
        //       //   child: Column(
        //       //     children: [
        //             //  ColorDots(product: product),
        //       // Container(height: 40, color: Color(0xFFF6F7F9),),
        //   Container(
        //     margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
        //     padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //       color: Color(0xFFF6F7F9),
        //       borderRadius: BorderRadius.only(
        //                       topLeft: Radius.zero
        //                       // topLeft: Radius.circular(40),
        //                       // topRight: Radius.circular(40),
        //                       // bottomLeft: Radius.circular(40),
        //                     ),
        //                   ),
        //     child: SizedBox(height: 70,),
        //   ),
        //       TopRoundedContainer(
        //               color: Colors.white,
        //               child: Padding(
        //                 padding: EdgeInsets.only(
        //                   left: SizeConfig.screenWidth * 0.15,
        //                   right: SizeConfig.screenWidth * 0.15,
        //                   bottom: getProportionateScreenWidth(40),
        //                   top: getProportionateScreenWidth(15),
        //                 ),
        //                 child: DefaultButton(
        //                   text: '放入購物車',
        //                   press: () {
        //                     var cart = context.read<CartModel>();
        //                     cart.add(product);
        //                   },
        //                 ),
        //               ),
        //             ),
        //       //     ],
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
