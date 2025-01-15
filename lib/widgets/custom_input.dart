import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obScureTest;

  const CustomInput({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    required this.obScureTest,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obScureTest,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(
            fontSize: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
        ),
      ),
    );
  }
}
