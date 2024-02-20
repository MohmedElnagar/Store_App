import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';

class CustomRishText extends StatelessWidget {
  const CustomRishText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return RichText(
        text: TextSpan(
            text: r"$ ",
            style: theme.bodyMedium?.copyWith(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            children: [
          TextSpan(
            text: text,
            style: theme.bodyMedium
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ]));
  }
}
