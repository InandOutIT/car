import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFEBECF0);
const kSeconderyColor = Colors.white;
const kButtonsColor = Color(0xFF191919);
const kEmailRegex =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const kPhoneRegex = r"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$";
const kBaseUrl = 'http://127.0.0.1:8000/';
const kPaths = {
  'logo': 'assets/logos/logo.svg',
};

const kCopyright = 'Copyright In&Out®';

List kWelcomeScreen = [
  {
    "header": "Why book with us?",
    "description":
        "Find the rental car that works for you.\nNo hidden charges.\nGreat service!",
    "image": "assets/images/welcome-2.png"
  },
  {
    "header": "Online booking and amendments",
    "description":
        "Cancel or change your booking with just the click of a button.",
    "image": "assets/images/welcome-1.png"
  },
  {
    "header": "Book with confidence",
    "description":
        "We know it's important to trust the site you book your car hire with, which is why we're on two of the best-trusted independent review platforms.",
    "image": "assets/images/welcome-3.png"
  },
];

List kCarsDemo = [
  {
    "name": "Sportback RS 5",
    "logo": 'assets/logos/bmw.svg',
    "image": 'assets/images/car_5.jpg'
  },
  {
    "name": "Tesla Model S",
    "logo": 'assets/logos/audi.svg',
    "image": 'assets/images/car_2.jpg'
  },
  {
    "name": "Tesla Model X",
    "logo": 'assets/logos/bmw.svg',
    "image": 'assets/images/car_3.jpg'
  },
  {
    "name": "Tesla Model Y",
    "logo": 'assets/logos/audi.svg',
    "image": 'assets/images/car_4.jpg'
  },
  {
    "name": "Tesla Model Y2",
    "logo": 'assets/logos/bmw.svg',
    "image": 'assets/images/car_5.jpg'
  },
  {
    "name": "Tesla Model Z",
    "logo": 'assets/logos/audi.svg',
    "image": 'assets/images/car_5.jpg'
  },
];
