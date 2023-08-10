import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items on scale
  final List _shopItems = [
    // [itemName, itemPrice, itemPath, color]
    ["Avocado", "4.00", "images/avocado.png", Colors.green],
    ["Banana", "4.00", "images/banana.png", Colors.yellow],
    ["Chicken", "4.00", "images/chicken.png", Colors.brown],
    ["Water", "4.00", "images/water.png", Colors.blue],
  ];

  //list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item to cart
  void removeItemsToCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
