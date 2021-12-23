import 'package:flutter/material.dart';

import 'specification_card.dart';

class CarSpecsList extends StatelessWidget {
  const CarSpecsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          SizedBox(width: 10.0),
          SpecificationCard(
            specName: 'Transition',
            specValue: 'Automatic',
          ),
          SpecificationCard(
            specName: 'Acceleration',
            specValue: '4.2s 0-150 k/h',
          ),
          SpecificationCard(
            specName: 'Car Seats',
            specValue: '5 seats',
          ),
          SpecificationCard(
            specName: 'Transition',
            specValue: 'Automatic',
          ),
          SpecificationCard(
            specName: 'Transition',
            specValue: 'Automatic',
          ),
          SpecificationCard(
            specName: 'Transition',
            specValue: 'Automatic',
          ),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }
}
