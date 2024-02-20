import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';

class NoItem extends StatelessWidget {
  const NoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 450),
      child: const Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(
                "assets/images/search_fail.png",
              ),
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "No Result Found",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
