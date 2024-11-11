import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/models/product_model.dart';

class Shop extends ChangeNotifier{

  // products for sale
  final List<Product> _shop = [
    Product(
        Name: "\$Gonads",
        imagepath: "lib/assets/20241007_100007.jpg",
        description: "Depressed testicle",
        price: "\$10"),
    Product(
        Name: "PokeSei",
        imagepath: "lib/assets/ac9sru.jpg",
        description: "Foreshadowed cannon event?",
        price: "\$5"),
    Product(
        Name: "Farmoors",
        imagepath: "lib/assets/20241027_103103.jpg",
        description: "I have no idea what this is",
        price: "\$3"),
    Product(
        Name: "Rug on Sei",
        imagepath: "lib/assets/20240920_005621.jpg",
        description: "Special edition Rug on Sei: Rug Jesus",
        price: "\$10"),
  ];
  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addItemToCart (Product item){
    _cart.add(item);
    notifyListeners();
  }
  // remove item from cart
  void removeItemFromCart (Product item){
    _cart.remove(item);
    notifyListeners();
  }
}