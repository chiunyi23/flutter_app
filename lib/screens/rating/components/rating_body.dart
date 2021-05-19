import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Account.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../size_config.dart';
import 'package:shop_app/screens/cart/components/cart_card.dart';
import 'package:provider/provider.dart';
import 'rating_card.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Body extends StatefulWidget {
  // final String id;
  Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double rating;

  Future<void> _showMyRating(BuildContext context, AccountModel user, int index) async {
    // var user = context.watch<AccountModel>();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('商品評分'),
          content: SingleChildScrollView(
            child: RatingBar.builder(
              initialRating: user.history[index].rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
                setState(() {
                  this.rating = rating;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('確定'),
              onPressed: () {
                setState(() {
                  user.changeRating(index, rating);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // var inCart = context.watch<CartModel>();
    var user = context.watch<AccountModel>();
    print('rebuild');
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: user.history.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                _showMyRating(context, user, index);
              },
             child: RatingCard(product: user.history[index]),
            )
        ),
      ),
    );
  }
}
