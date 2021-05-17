import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/take_order/components/product_snapshot.dart';

import '../../../size_config.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';

class OrderedItem extends StatelessWidget {
  // ignore: sort_constructors_first
  const OrderedItem({Key key, @required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    var inCart = context.watch<CartModel>();
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "取貨"),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                inCart.counter,
                    (index) {
                  return ProductSnapshot(product: inCart.products[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }
}
// child: CartCard(product: inCart.products[index]),
