import 'package:car_rental/constants.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.bgColor,
  }) : super(key: key);
  final String text;
  final Function onTap;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.0,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onTap as void Function()?,
        child: Text(
          text,
          style: const TextStyle(
            color: kSeconderyColor,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
