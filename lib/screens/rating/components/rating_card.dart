import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Account.dart';
import 'package:shop_app/models/Product.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // var user = Provider.of<AccountModel>(context);
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: '${product.price}',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                // children: [
                //   TextSpan(
                //       text: " x${cart.numOfItem}",
                //       style: Theme.of(context).textTheme.bodyText1),
                // ],
              ),
            )
          ],
        ),
        Expanded(
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/Star Icon.svg', height: 20, width: 50,),
                ((){
                  return Text(product.rating == 0.0? '????????????': product.rating.toString());
                }()),
              ],
            ),
        ),
      ],
    );
  }
}
