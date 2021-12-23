import 'package:car_rental/components/small_button.dart';
import 'package:car_rental/screens/home_screen/components/category_label.dart';
import 'package:car_rental/screens/home_screen/components/product_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({ Key? key }) : super(key: key);

  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  get kCarsDemo => null;

  @override
  Widget build(BuildContext context) {
    final bool temp = true;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context) {
                  return SmallButton(
                    tooltip: 'Oopen\nDrawer',
                    icon: const Icon(Icons.menu),
                    function: () => Scaffold.of(context).openDrawer(),
                    color: kSeconderyColor,
                  );
                }),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: kSeconderyColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20.0),

          // Search box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kSeconderyColor,
              ),
              height: 50.0,
              width: double.infinity,
              child: const ListTile(
                leading: Icon(
                  Icons.search,
                  size: 20.0,
                ),
                title: Text(
                  'Find a car...',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                CategoryLabel(
                    label: 'Luxury',
                    cardColor: kButtonsColor,
                    fontColor: kSeconderyColor),
                CategoryLabel(
                    label: 'Mini',
                    cardColor: kSeconderyColor,
                    fontColor: kButtonsColor),
                CategoryLabel(
                    label: 'Economy',
                    cardColor: kSeconderyColor,
                    fontColor: kButtonsColor),
                CategoryLabel(
                    label: 'Compact',
                    cardColor: kSeconderyColor,
                    fontColor: kButtonsColor),
                CategoryLabel(
                  label: 'SUV',
                  cardColor: kSeconderyColor,
                  fontColor: kButtonsColor,
                ),
                CategoryLabel(
                  label: 'Standard',
                  cardColor: kSeconderyColor,
                  fontColor: kButtonsColor,
                ),
                SizedBox(width: 20.0),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Available Near You',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'With Driver',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Switch(
                      value: temp,
                      onChanged: (temp) {},
                      activeColor: Colors.grey,
                      activeTrackColor: kButtonsColor,
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                GridView.count(
                  physics: const ScrollPhysics(),
                  childAspectRatio: 0.7,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  children: [
                    ProductCard(
                      productName: kCarsDemo[0]['name'],
                      logoImage: kCarsDemo[0]['logo'],
                      price: 50.0,
                      image: kCarsDemo[0]['image'],
                      duration: '/Day',
                      index: 0,
                    ),
                    ProductCard(
                      productName: kCarsDemo[1]['name'],
                      logoImage: kCarsDemo[1]['logo'],
                      price: 52.0,
                      image: kCarsDemo[1]['image'],
                      duration: '/Day',
                      index: 1,
                    ),
                    ProductCard(
                      productName: kCarsDemo[2]['name'],
                      logoImage: kCarsDemo[2]['logo'],
                      price: 45.0,
                      image: kCarsDemo[2]['image'],
                      duration: '/Day',
                      index: 2,
                    ),
                    ProductCard(
                      productName: kCarsDemo[3]['name'],
                      logoImage: kCarsDemo[3]['logo'],
                      price: 90.0,
                      image: kCarsDemo[3]['image'],
                      duration: '/Day',
                      index: 3,
                    ),
                    ProductCard(
                      productName: kCarsDemo[4]['name'],
                      logoImage: kCarsDemo[4]['logo'],
                      price: 80.0,
                      image: kCarsDemo[4]['image'],
                      duration: '/Day',
                      index: 4,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      );
  }
}