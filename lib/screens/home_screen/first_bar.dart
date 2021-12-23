import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Icon(
        Icons.face,
        size: 40,
        color: Colors.black,
      ),
    );
  }
}
