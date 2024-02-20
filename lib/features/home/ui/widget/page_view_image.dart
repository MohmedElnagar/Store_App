import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';
import 'package:shop_app/features/home/data/app_data.dart';
import 'package:shop_app/features/home/data/model/base_model.dart';
import 'package:shop_app/features/detalis/ui/detalis.dart';

class PageViewImage extends StatefulWidget {
  const PageViewImage({
    super.key,
    required this.size,
    required this.theme,
  });

  final Size size;
  final TextTheme theme;

  @override
  State<PageViewImage> createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 2, viewportFraction: .7);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 550),
      child: Hero(
        tag: 1,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: widget.size.width,
          height: widget.size.height * .45,
          child: PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              itemCount: mainlist.length,
              itemBuilder: (context, index) {
                BaseModel baseModel = mainlist[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Detalis(
                        iscome: false,
                        data: mainlist[index],
                      );
                    }));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: widget.size.width * .6,
                        height: widget.size.height * .35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                baseModel.imageUrl,
                              ),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(61, 0, 0, 0),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      Text(baseModel.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      RichText(
                          text: TextSpan(
                              text: r"$ ",
                              style: widget.theme.bodyMedium?.copyWith(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                              text: baseModel.price.toString(),
                              style: widget.theme.bodyMedium?.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )
                          ])),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
