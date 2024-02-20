import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeTextSeeAll extends StatelessWidget {
  const FadeTextSeeAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 650),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Most popular",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "See all",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
