import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  // final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    // this.colors = Colors.white,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

/*
Future <List<Product>> getProducts() async {
  final response = await
}
*/


// Our demo Products

Map<String, List<Product>> demoProducts = {
'1':
  [
    Product(
      id: 1,
      images: [
        "assets/images/beers.png",
        // "assets/images/ps4_console_white_2.png",
        // "assets/images/ps4_console_white_3.png",
        // "assets/images/ps4_console_white_4.png",
      ],
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: "Tiger",
      price: 64.99,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 2,
      images: [
        "assets/images/beers.png",
      ],
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: "juice",
      price: 50.5,
      description: description,
      rating: 4.1,
      isPopular: true,
    ),
    Product(
      id: 3,
      images: [
        "assets/images/beers.png",
      ],
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: "Brown Ale",
      price: 36.55,
      description: description,
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 4,
      images: [
        "assets/images/beers.png",
      ],
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: "Wheat Beer",
      price: 20.20,
      description: description,
      rating: 4.1,
      isFavourite: true,
    ),
  ],
  '2':[
    Product(
    id: 1,
    images: [
    "assets/images/beers.png",
    ],
    // colors: [
    // Color(0xFFF6625E),
    // Color(0xFF836DB8),
    // Color(0xFFDECB9C),
    // Colors.white,
    // ],
    title: "Wheat Beer",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    ),
    ],
};

const String description = "some descriptions …";
