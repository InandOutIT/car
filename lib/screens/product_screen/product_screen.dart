// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../../constants.dart';
import '../../uae_geo.dart';
import 'components/big_car_card.dart';
import 'components/car_specs_list.dart';
import 'components/custom_app_bar.dart';
import 'components/owner_info.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(24.4241, 53.9900),
    zoom: 6.9,
  );
  final Completer<GoogleMapController> _controller = Completer();
  Set<Polygon> polygon = new Set();
  Marker marker = Marker(
    markerId: const MarkerId('origin'),
    infoWindow: const InfoWindow(title: 'Origin'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(23.4241, 53.8478),
  );

  bool firstToUse = true;

  @override
  void initState() {
    super.initState();
    List<LatLng> distPoints = addPoints();
    List<Polygon> addPolygon = [
      Polygon(
        polygonId: const PolygonId('UAE'),
        points: distPoints,
        consumeTapEvents: true,
        strokeColor: Colors.grey,
        strokeWidth: 1,
        fillColor: Colors.lightBlue.withOpacity(0.4),
      ),
    ];
    polygon.addAll(addPolygon);
  }

  List<LatLng> addPoints() {
    List<LatLng> point = [];
    for (var i = 0; i < GeoJson.kUAE.length; i++) {
      var latLang = LatLng(GeoJson.kUAE[i][1], GeoJson.kUAE[i][0]);
      point.add(latLang);
    }
    return point;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    CustomAppBar(),
                    SizedBox(height: 20.0),
                    BigCarCard(
                      carName: kCarsDemo[widget.index]['name'],
                      image: kCarsDemo[widget.index]['image'],
                      logo: kCarsDemo[widget.index]['logo'],
                    ),
                    SizedBox(height: 20.0),
                    OwnerInfo(),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              const CarSpecsList(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      decoration: BoxDecoration(
                          color: kSeconderyColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: kButtonsColor,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'JI.H Juanda No.4322, Ciburial, Bandung',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 400.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: GoogleMap(
                          onTap: (LatLng point) {
                            //print(point.latitude);
                            //print(point.longitude);
                            _addMarker(point);
                          },
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          initialCameraPosition: _initialCameraPosition,
                          //polygons: polygon,
                          markers: {if (!firstToUse) marker},
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(
                              text: '\$170',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '/Day',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: kButtonsColor,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              height: 60.0,
                              child: const Center(
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: kSeconderyColor,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    //print(pos.latitude);
    //print(pos.longitude);
    setState(() {
      firstToUse = false;
      marker = Marker(
        markerId: const MarkerId('origin'),
        infoWindow: const InfoWindow(title: 'Origin'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: pos,
      );
    });
  }
}









// class VerticalSliderDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: CarouselSlider(
//         options: CarouselOptions(
//           aspectRatio: 2.0,
//           enlargeCenterPage: true,
//           scrollDirection: Axis.horizontal,
//           enableInfiniteScroll: false,
//         ),
//         items: [
//           Image.asset(
//             'assets/images/car_1.jpg',
//           ),
//           Image.asset(
//             'assets/images/car_1.jpg',
//           ),
//         ],
//       ),
//     );
//   }
// }
