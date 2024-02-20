import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';
import 'package:shop_app/features/home/data/model/base_model.dart';

class ImageAndGrade extends StatelessWidget {
  const ImageAndGrade({
    super.key,
    required this.size,
    required this.baseModel,
  });

  final Size size;
  final BaseModel baseModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 1,
          child: Container(
            width: size.width,
            height: size.height * .5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  baseModel.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -25,
          child: Container(
            width: size.width,
            height: size.height * .099,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: gradient,
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter)),
          ),
        ),
      ],
    );
  }
}
