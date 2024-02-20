import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';
import 'package:shop_app/features/detalis/ui/detalis.dart';
import 'package:shop_app/features/home/data/app_data.dart';
import 'package:shop_app/features/home/data/model/base_model.dart';
import 'package:shop_app/features/home/data/model/function/AddToCard.dart';

class ScreenIsSearch extends StatelessWidget {
  const ScreenIsSearch({
    super.key,
    required this.size,
    required this.theme,
  });

  final Size size;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemonsearch.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .63, crossAxisCount: 2),
      itemBuilder: ((context, index) {
        BaseModel baseModel = itemonsearch[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Detalis(
                iscome: false,
                data: mainlist[index],
              );
            }));
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: size.height * .02,
                left: size.width * .01,
                right: size.width * .01,
                child: Container(
                  width: size.width * .5,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: size.height * .28,
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * .02,
                child: Text(baseModel.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Positioned(
                bottom: size.height * .0004,
                child: RichText(
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
              ),
              Positioned(
                top: size.height * .010,
                right: size.width * .01,
                child: CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: IconButton(
                      onPressed: () {
                        AddToCard.addtocard(baseModel, context);
                      },
                      icon: const Icon(Icons.add_shopping_cart,
                          color: Colors.white)),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
