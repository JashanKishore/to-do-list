import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double cornerRadius;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.black, 
    this.textColor = Colors.white,     
    this.cornerRadius = 8, 
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Text(text),
    );
  }
}