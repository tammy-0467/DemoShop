import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/models/product_model.dart';
import 'package:minimalecommerceapp/models/shop.dart';
import 'package:minimalecommerceapp/pages/shop_page.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  //add to cart method
  void addToCart(BuildContext context){
    DelightToastBar(
        builder: (context) => ToastCard(
          title: Text("Worthless JPEG successfully added to cart"),
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

  context.read<Shop>().addItemToCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          //image
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                width: double.infinity,
                padding: EdgeInsets.all(25),
                child: Image.asset(
                    product.imagepath)
            ),
          ),

          const SizedBox(height: 25,),

          //product name
          Text(
            product.Name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),

          const SizedBox(height: 10,),

          //product description
          Text(product.description,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
          ),
          ),

          const SizedBox(height: 10,),
          //price + cart button
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.price),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: ()=> addToCart(context)
                       ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
