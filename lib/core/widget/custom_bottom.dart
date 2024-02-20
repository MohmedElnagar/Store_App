import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.size,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
      onPressed: onPressed,
      minWidth: size.width * .9,
      height: size.height * .07,
      color: Colors.black,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ));
  }
}
