import 'package:car_rental/constants.dart';
import 'package:flutter/material.dart';

class CustomizedFormField extends StatelessWidget {
  const CustomizedFormField({
    Key? key,
    required this.textInputType,
    required this.prefixIcon,
    required this.labelText,
    required this.textEditingController,
    required this.validate,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
  }) : super(key: key);

  final TextInputType textInputType;
  final IconData prefixIcon;
  final String labelText;
  final TextEditingController textEditingController;
  final Function validate;
  final bool obscureText, enableSuggestions, autocorrect;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      style: const TextStyle(fontSize: 18.0, color: kButtonsColor),
      keyboardType: textInputType,
      cursorColor: kButtonsColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: kButtonsColor,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 18.0,
          color: Colors.black54,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kButtonsColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) => validate(value),
    );
  }
}
