import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/home/ui/home.dart';

class NoItem extends StatelessWidget {
  const NoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: const Image(
              image: AssetImage("assets/images/empty.png"),
              fit: BoxFit.cover,
            )),
        FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: const Text(
              "Your caed is empty right now",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Home();
                }));
              },
              icon: const Icon(Icons.shopify_rounded)),
        )
      ],
    );
  }
}
