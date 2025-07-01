import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meet/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  const HomeMeetingButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: const Color.fromARGB(97, 0, 0, 0),
                  offset: Offset(0, 4),
                ),
              ],
            ),
            width: 60,
            height: 60,
            child: Icon(icon, size: 30),
          ),
          SizedBox(height: 10),
          Text(text, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
