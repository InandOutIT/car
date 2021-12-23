import 'package:flutter/material.dart';

import '../../../constants.dart';

class SpecificationCard extends StatelessWidget {
  const SpecificationCard({
    required this.specName,
    required this.specValue,
  });

  final String specName;
  final String specValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 18.0,
      ),
      margin: const EdgeInsets.only(left: 10.0),
      height: 90.0,
      decoration: BoxDecoration(
          color: kSeconderyColor, borderRadius: BorderRadius.circular(10.0),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            specName,
            style: const TextStyle(
              color: Colors.grey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            specValue,
            style: const TextStyle(fontSize: 18.0),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
