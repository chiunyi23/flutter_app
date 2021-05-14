import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  // final List<Color> colors;
  final double rating;
  final int price;
  final bool isFavourite, isPopular;
  final String machine_id;

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
    this.machine_id = '1',
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
        'assets/images/drink1.jpg',
        "assets/images/drink2.jpg",
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
      price: 64,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 2,
      images: [
        "assets/images/drink3.jpg",
      ],
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: "juice",
      price: 50,
      description: description,
      rating: 4.1,
      isPopular: true,
    ),
    Product(
      id: 3,
      images: [
        "assets/images/drink4.jpg",
      ],
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: "Brown Ale",
      price: 36,
      description: description,
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 4,
      images: [
        "assets/images/beer.png",
      ],
      // colors: [
      //   Color(0xFFF6625E),
      //   Color(0xFF836DB8),
      //   Color(0xFFDECB9C),
      //   Colors.white,
      // ],
      title: "Wheat Beer",
      price: 20,
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
    price: 40,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    ),
    Product(
      id: 2,
      images: [
        "assets/images/drink5.jpg",
      ],
      // colors: [
      // Color(0xFFF6625E),
      // Color(0xFF836DB8),
      // Color(0xFFDECB9C),
      // Colors.white,
      // ],
      title: "Kirin Bar Beer",
      price: 50,
      description: description,
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
    ),
    ],
  '3':[
    Product(
      id: 1,
      images: [
        "assets/images/drink10.jpg",
        "assets/images/drink10_2.jpg"
      ],
      // colors: [
      // Color(0xFFF6625E),
      // Color(0xFF836DB8),
      // Color(0xFFDECB9C),
      // Colors.white,
      // ],
      title: "Tree Top 蘋果汁",
      price: 40,
      description: '''樹頂是自1938年起值得信賴的美國品牌\n以新鮮絶佳的口感聞名於市場\n由2顆新鮮蘋果製成\n100% 蘋果汁、健康、無糖、無負擔\n無人工添加物、 人工色素或防腐劑''',
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 2,
      images: [
        "assets/images/drink8.jpg",
      ],
      // colors: [
      // Color(0xFFF6625E),
      // Color(0xFF836DB8),
      // Color(0xFFDECB9C),
      // Colors.white,
      // ],
      title: "Kirin Bar Beer",
      price: 50,
      description: description,
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
    ),
  ],
};

const String description = "some descriptions …";
