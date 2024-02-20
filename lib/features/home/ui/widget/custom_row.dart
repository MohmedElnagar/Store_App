import 'package:flutter/material.dart';
import 'package:shop_app/features/home/ui/widget/CustomRishText.dart';

class CustomRoe extends StatelessWidget {
  const CustomRoe({Key? key, required this.price, required this.text})
      : super(key: key);
  final num price;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        CustomRishText(text: price.toString())
      ],
    );
  }
}
