import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.lightGreen,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
