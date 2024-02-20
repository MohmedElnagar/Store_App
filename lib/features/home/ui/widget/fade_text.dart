import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';

class FadeText extends StatelessWidget {
  const FadeText({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: "Find Your ",
                    style: theme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: "Style",
                    style: theme.displayMedium?.copyWith(
                        color: kPrimaryColor,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  )
                ])),
            RichText(
                text: const TextSpan(
                    text: "Be more beatufll with out",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    children: [
                  TextSpan(
                    text: "Suggestions:)",
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
