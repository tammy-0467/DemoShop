import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/components/product_tile.dart';
import 'package:minimalecommerceapp/main.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop

    final products = context.watch<Shop>().shop;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Shop Page"),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          //go to cart button
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/thirdPage'),
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Center(
            child: Text("Pick a worthless JPEG to waste money on",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
            ),
          ),
          
          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                padding: EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index)
                {
                  //get each individual product from shop
                  final product = products[index];
          
                  //return as a product tile UI
                  return ProductTile(product: product);
                }
            ),
          ),
        ],
      ),
    );
  }
}
