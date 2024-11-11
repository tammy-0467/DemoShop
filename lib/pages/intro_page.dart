import 'package:flutter/material.dart';

import '../components/my_button.dart';

class IntroPage extends StatelessWidget {

  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //App icon
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 20,),

            //Text
           const Text(
                "Minimal Shop",
                style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 10,),

            //subtitle
            Text(
                "Premium Quality Products",
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                ),
            ),

            const SizedBox(height: 10,),

            //button
            MyButton(
              component: Icon(
                Icons.arrow_forward
              ),
              onTap: (){
                Navigator.pushNamed(context, '/secondPage');
              }
            )
          ],
        ),
      ),
    );
  }
}
