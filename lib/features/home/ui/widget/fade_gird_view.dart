import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';
import 'package:shop_app/features/home/data/app_data.dart';
import 'package:shop_app/features/home/data/model/base_model.dart';
import 'package:shop_app/features/detalis/ui/detalis.dart';

class FedeGridView extends StatelessWidget {
  const FedeGridView({
    super.key,
    required this.size,
    required this.theme,
  });

  final Size size;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
        delay: const Duration(milliseconds: 750),
        child: SizedBox(
            width: size.width,
            height: size.height * .44,
            child: GridView.builder(
                itemCount: mainlist.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .63, crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  BaseModel baseModel = mainlist[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Detalis(
                              iscome: false,
                              data: mainlist[index],
                            );
                          }));
                        },
                        child: Container(
                          width: size.width * .5,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: size.height * .3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(baseModel.imageUrl),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(61, 0, 0, 0),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(baseModel.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      RichText(
                          text: TextSpan(
                              text: r"$ ",
                              style: theme.bodyMedium?.copyWith(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                              text: baseModel.price.toString(),
                              style: theme.bodyMedium?.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )
                          ])),
                    ],
                  );
                }))));
  }
}
