import 'package:flutter/material.dart';
import 'package:meet/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({required this.text,required this.onPressed , super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(90, 40)
      ),
      child: Text(text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900),),
      );
  }
}
