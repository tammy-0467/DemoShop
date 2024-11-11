import 'package:flutter/material.dart';
import 'package:minimalecommerceapp/models/shop.dart';
import 'package:minimalecommerceapp/pages/cart_page.dart';
import 'package:minimalecommerceapp/pages/intro_page.dart';
import 'package:minimalecommerceapp/pages/shop_page.dart';
import 'package:minimalecommerceapp/theme/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => Shop(),
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroPage(),
        '/secondPage': (context) => const ShopPage(),
        '/thirdPage': (context) => const CartPage()
      },
      theme: lightMode,
    );
  }
}
