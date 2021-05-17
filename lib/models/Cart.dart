import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Product.dart';

// class Cart {
//   final Product product;
//   final int numOfItem;
//
//   Cart({@required this.product, @required this.numOfItem});
// }

// Demo data for our cart

// List<Cart> demoCarts = [
//   Cart(product: demoProducts['1'][0], numOfItem: 2),
//   Cart(product: demoProducts['1'][1], numOfItem: 1),
//   Cart(product: demoProducts['1'][3], numOfItem: 1),
// ];

class CartModel extends ChangeNotifier {
  List<Product> _products = [];
  int counter = 0;
  List<Product> get products => _products;
  String mID;

  int totalPrice() {
    int total = 0;
    for(var product in products) {
      total += product.price;
    }
    return total;
  }
  void add(Product product) {
    _products.add(product);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    counter++;
    print('in add: ');
    print(counter);
    notifyListeners();
  }

  void remove(Product product) {
    _products.remove(product);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    counter--;
    print('in remove: ');
    print(counter);
    notifyListeners();
  }

//   void clearAll() {
//     _products.clear();
//     notifyListeners();
//   }
}

/*
class CartModel extends ChangeNotifier {
  /// The private field backing [catalog].
  Product _selected;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds = [];

  /// The current catalog. Used to construct items from numeric ids.
  Product get selected => _selected;

  set selected(Product newProduct) {
    _selected = newProduct;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  /// List of items in the cart.
  // List<Product> get items => _itemIds.map((id) => _selected.getById(id)).toList();

  /// The current total price of all items.
  // double get totalPrice =>
  //     items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Product product) {
    _itemIds.add(product.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Product product) {
    _itemIds.remove(product.id);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }

 }
 */