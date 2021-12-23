import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
    required this.tooltip,
    required this.icon,
    required this.function,
    required this.color,
  }) : super(key: key);

  final String tooltip;
  final Icon icon;
  final Function function;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
      ),
      child: Material(
        color: kSeconderyColor,
        borderRadius: BorderRadius.circular(20.0),
        child: IconButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            function();
          },
          icon: icon,
          tooltip: tooltip,
          splashRadius: 20.0,
        ),
      ),
    );
  }
}
