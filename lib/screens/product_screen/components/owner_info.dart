import 'package:flutter/material.dart';

import '../../../constants.dart';


class OwnerInfo extends StatelessWidget {
  const OwnerInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Renter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: kSeconderyColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 10.0),
                const Text('Mahmoud'),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}