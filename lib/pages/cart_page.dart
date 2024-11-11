import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/components/my_button.dart';
import 'package:minimalecommerceapp/components/product_tile.dart';
import 'package:minimalecommerceapp/models/shop.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../models/product_model.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart
  void removeItemFromCart(BuildContext context, Product product){
    DelightToastBar(
        builder: (context) => ToastCard(
          title: Text("Worthless JPEG successfully removed from cart"),
          leading: Icon(
            Icons.flutter_dash,
            size: 28,
          ),
          color: Colors.grey[100],
        ),
        snackbarDuration: Duration(milliseconds: 1500),
        autoDismiss: true,
        animationDuration: Duration(milliseconds: 650)
    ).show(context);

    context.read<Shop>().removeItemFromCart(product);
  }

  void payButtonPressed (BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext dialogContext){
          DelightToastBar(
              builder: (context) => ToastCard(
                title: Text("Successfully paid for Worthless JPEG "),
                leading: Icon(
                  Icons.flutter_dash,
                  size: 28,
                ),
                color: Colors.grey[100],
              ),
              snackbarDuration: Duration(milliseconds: 1500),
              autoDismiss: true,
              animationDuration: Duration(milliseconds: 650)
          ).show(context);
          return Container();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart page
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Cart Page"),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      body: Column(
       children: [
         //cart list
         Expanded(
           child: cart.isEmpty ?
           Center (child: Text("Your cart is empty..."))
               : ListView.builder(
               itemCount: cart.length,
               itemBuilder: (context, index){
                 final item = cart[index];

                 return ListTile(
                   title:  Text(item.Name),
                   subtitle: Text(item.price),
                   trailing: IconButton(
                       onPressed: ()=> removeItemFromCart(context, item),
                       icon: Icon(Icons.remove)),
                 );
               }
           ),
         ),

         //pay button
         Padding(
           padding: const EdgeInsets.all(50.0),
           child: MyButton(
               component: Text("Pay now"),
               onTap: ()=> payButtonPressed(context)
           ),
         )
       ],
      ),
    );
  }
}
