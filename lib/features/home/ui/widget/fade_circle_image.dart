import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/home/data/app_data.dart';
import 'package:shop_app/features/home/data/model/catgre_model.dart';

class FadeCircleImage extends StatelessWidget {
  const FadeCircleImage({
    super.key,
    required this.size,
    required this.theme,
  });

  final Size size;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 450),
      child: Container(
          margin: const EdgeInsets.only(top: 7),
          height: size.height * .14,
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: catgre.length,
            itemBuilder: ((context, index) {
              CategoriesModel categories = catgre[index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        categories.imageUrl,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .008,
                    ),
                    Text(
                      categories.title,
                      style: theme.bodyMedium,
                    )
                  ],
                ),
              );
            }),
          )),
    );
  }
}
