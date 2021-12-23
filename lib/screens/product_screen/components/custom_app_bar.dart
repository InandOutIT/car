import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: kSeconderyColor,
          ),
          child: Material(
            color: kSeconderyColor,
            borderRadius: BorderRadius.circular(20.0),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Back',
              splashRadius: 20.0,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: kSeconderyColor,
          ),
          child: Material(
            color: kSeconderyColor,
            borderRadius: BorderRadius.circular(20.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
              tooltip: 'Options',
              splashRadius: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}