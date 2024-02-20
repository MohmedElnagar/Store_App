import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';
import 'package:shop_app/core/widget/custom_bottom.dart';
import 'package:shop_app/features/detalis/ui/widget/detalis_item.dart';
import 'package:shop_app/features/detalis/ui/widget/image_and_grade.dart';
import 'package:shop_app/features/home/data/model/base_model.dart';
import 'package:shop_app/features/home/data/model/function/AddToCard.dart';

class Detalis extends StatefulWidget {
  const Detalis({super.key, required this.data, required this.iscome});
  final BaseModel data;
  final bool iscome;
  @override
  State<Detalis> createState() => _DetalisState();
}

class _DetalisState extends State<Detalis> {
  int selectsize = 3;
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    BaseModel baseModel = widget.data;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
          iconSize: 30,
          splashColor: Colors.white,
          highlightColor: Colors.white,
          tooltip: 'Back',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const Search(),
              //   ),
              // );
            },
            color: Colors.white,
            iconSize: 30,
            splashColor: Colors.white,
            highlightColor: Colors.white,
            tooltip: 'Search',
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * .5,
              child: ImageAndGrade(size: size, baseModel: baseModel),
            ),
            NameAnddetalis(size: size, baseModel: baseModel, theme: theme),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "Select Size",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: SizedBox(
                height: size.height * 0.08,
                width: size.width * 9,
                child: ListView.builder(
                    itemCount: sizes.length,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var current = sizes[index];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectsize = index;
                          });
                        },
                        child: AnimatedContainer(
                            width: size.width * .12,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kPrimaryColor, width: 2),
                                borderRadius: BorderRadius.circular(12),
                                color: selectsize == index
                                    ? kPrimaryColor
                                    : Colors.transparent),
                            margin: const EdgeInsets.all(10),
                            duration: const Duration(milliseconds: 200),
                            child: Center(
                                child: Text(
                              current,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: selectsize == index
                                      ? Colors.white
                                      : Colors.black),
                            ))),
                      );
                    }),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "Select Colors",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 9,
                  child: ListView.builder(
                      itemCount: colors.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var listcolor = colors[index];

                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = index;
                              });
                            },
                            child: AnimatedContainer(
                              width: size.width * .12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedColor == index
                                        ? kPrimaryColor
                                        : Colors.transparent,
                                    width: selectedColor == index ? 2 : 1),
                                borderRadius: BorderRadius.circular(12),
                                color: listcolor,
                              ),
                              duration: const Duration(milliseconds: 200),
                            ));
                      }),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButtom(
                  onPressed: () {
                    AddToCard.addtocard(baseModel, context);
                  },
                  size: size,
                  text: "Add To Card",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
