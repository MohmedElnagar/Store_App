import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xfff9985f);
List<String> sizes = ["S", "H", "L", "XL", "XLL"];
List<Color> colors = const [
  Color.fromARGB(255, 255, 176, 170),
  Color.fromARGB(255, 189, 225, 255),
  Color.fromARGB(255, 205, 255, 207),
  Color.fromARGB(255, 245, 192, 255),
  Colors.white,
  Color.fromARGB(250, 181, 204, 1),
  Color.fromARGB(255, 238, 232, 177),
];
List<Color> gradient = [
  Colors.white,
  Colors.white,
  const Color.fromARGB(176, 255, 255, 255),
  const Color.fromARGB(92, 255, 255, 255),
  const Color.fromARGB(0, 255, 255, 255),
];

class AppConstantsColor {
  static const Color backgroundColor = Color(0xffebebeb);
  static const Color darkTextColor = Color(0xff171717);
  static const Color lightTextColor = Colors.white;
  static const Color unSelectedTextColor = Color(0xffc9c9c9);
  static const Color materialButtonColor = Color(0xfffa2f65);
}
