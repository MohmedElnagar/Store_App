import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';
import 'package:shop_app/features/home/data/model/base_model.dart';

class NameAnddetalis extends StatelessWidget {
  const NameAnddetalis({
    super.key,
    required this.size,
    required this.baseModel,
    required this.theme,
  });

  final Size size;
  final BaseModel baseModel;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    baseModel.name,
                    style: theme.bodyMedium
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  RichText(
                      text: TextSpan(
                          text: r"$ ",
                          style: theme.bodyMedium?.copyWith(
                              color: kPrimaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                          text: baseModel.price.toString(),
                          style: theme.bodyMedium?.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ])),
                ],
              ),
              SizedBox(
                height: size.height * 0.006,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(baseModel.star.toString(), style: theme.headlineSmall),
                  const SizedBox(
                    width: 8,
                  ),
                  Text("(${baseModel.preview.toString()}K+ review)",
                      style: theme.headlineSmall
                          ?.copyWith(color: Colors.grey, fontSize: 20)),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                    size: 15,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
