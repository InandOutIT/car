import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class BigCarCard extends StatelessWidget {
  const BigCarCard({
    Key? key,
    required this.carName,
    required this.logo,
    required this.image,
  }) : super(key: key);

  final String carName;
  final String logo;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kSeconderyColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            carName,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              SvgPicture.asset(
                logo,
                height: 15,
              ),
              const SizedBox(width: 20.0),
              const Text('2022'),
            ],
          ),
          const SizedBox(height: 20.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Hero(
              tag: carName,
              child: Image.asset(
                image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
