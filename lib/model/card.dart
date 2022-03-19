import 'package:flutter/material.dart';

class Cardd {
  final String logo;
  final String number;
  final String title;
  final String plan;
  final List<Color> color;

  const Cardd(
      {required this.logo,
      required this.number,
      required this.title,
      required this.plan,
      required this.color});
}

List<Cardd> cards = [
  const Cardd(
      logo:
          "images/visa.png" ,
      number: " ••••     ••••     ••••     5678",
      title: "VISA",
      plan: "PLATINUM",
      color: [Color(0xFF7017FF), Color(0xFF8138FF)]),
  const Cardd(
      logo: "images/icons8-mastercard-512.png",
      number: " ••••     ••••     ••••     2304",
      title: "MASTERCARD",
      plan: "PREMIUM",
      color: [Color(0xff7F00FF), Color(0xffE100FF)]),
  const Cardd(
      logo: "images/icons8-paypal-480.png",
      number: " ••••     ••••     ••••     4783",
      title: "PAYPAL",
      plan: "PLATINUM",
      color: [Color(0xff005c97), Color(0xff363795)]),
];
