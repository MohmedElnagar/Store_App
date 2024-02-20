import 'package:flutter/material.dart';
import 'package:shop_app/features/home/ui/widget/fade_circle_image.dart';
import 'package:shop_app/features/home/ui/widget/fade_gird_view.dart';
import 'package:shop_app/features/home/ui/widget/fade_text.dart';
import 'package:shop_app/features/home/ui/widget/fade_text_see_all.dart';
import 'package:shop_app/features/home/ui/widget/page_view_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeText(theme: theme),
            FadeCircleImage(size: size, theme: theme),
            PageViewImage(size: size, theme: theme),
            const FadeTextSeeAll(),
            const SizedBox(
              height: 15,
            ),
            FedeGridView(size: size, theme: theme)
          ],
        ),
      ),
    );
  }
}
