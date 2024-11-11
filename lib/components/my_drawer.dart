import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/components/my_list_tile.dart';
import 'package:minimalecommerceapp/pages/shop_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header
              DrawerHeader(
                  child: Icon(Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              //divider
              Divider(height: 15,),

              MyListTile(
                icon: Icons.shopping_bag,
                text: "Shop Page",
                onTap: () => Navigator.pop(context),
              ),

              MyListTile(
                  icon: Icons.shopping_cart,
                  text: "Cart Page",
                  onTap: (){
                    Navigator.pop(context);

                    Navigator.pushNamed(context, "/thirdPage");
                  }
              ),
            ],
          ),

          MyListTile(
              icon: Icons.logout,
              text: "Exit",
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, "/", (route)=> false)
          ),

        ],
      ),
    );
  }
}
