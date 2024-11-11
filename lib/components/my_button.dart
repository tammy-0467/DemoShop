import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Widget component;
  void Function()? onTap;
  MyButton({super.key, required this.component, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: EdgeInsets.all(25),
        child: component,
      ),
    );
  }
}
