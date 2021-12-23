import 'package:car_rental/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

import '../../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.productName,
    required this.image,
    required this.logoImage,
    required this.price,
    required this.duration,
    required this.index,
  });
  final String productName;
  final String image;
  final String logoImage;
  final double price;
  final String duration;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 200,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            Get.to(
              () => ProductPage(
                index: index,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Hero(
                    tag: productName,
                    child: Image.asset(
                      image,
                      height: 100.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  productName,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SvgPicture.asset(
                    logoImage,
                    height: 15,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '\$' + price.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: duration,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: kButtonsColor,
                      ),
                      height: 40.0,
                      width: 40.0,
                      child: const Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
