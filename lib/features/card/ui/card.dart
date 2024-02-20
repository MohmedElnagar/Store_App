import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';
import 'package:shop_app/core/widget/custom_bottom.dart';
import 'package:shop_app/features/home/data/app_data.dart';
import 'package:shop_app/features/home/data/model/base_model.dart';
import 'package:shop_app/features/home/ui/widget/CustomRishText.dart';
import 'package:shop_app/features/home/ui/widget/custom_row.dart';
import 'package:shop_app/features/search/ui/widget/no_item.dart';

class PageCard extends StatefulWidget {
  const PageCard({Key? key}) : super(key: key);

  @override
  _PageCardState createState() => _PageCardState();
}

class _PageCardState extends State<PageCard> {
  double totalprice() {
    double total = 0;
    if (itemOncard.isEmpty) {
      total = 0;
    } else {
      for (BaseModel model in itemOncard) {
        total = total + model.price * model.value;
      }
    }
    return total;
  }

  int calcoratorsubtotal() {
    int Subtotal = 0;
    if (itemOncard.isEmpty) {
      Subtotal = 0;
    } else {
      for (BaseModel model in itemOncard) {
        Subtotal = Subtotal + model.price.round();
        Subtotal = Subtotal + 160;
      }
    }
    return Subtotal < 0 ? 0 : Subtotal;
  }

  double calcoratorshoping() {
    double shoping = 0;
    if (itemOncard.isEmpty) {
      shoping = 0;
      return shoping;
    } else if (itemOncard.length <= 4) {
      shoping = 25.99;
      return shoping;
    } else {
      shoping = 88.99;
      return shoping;
    }
  }

  void onDelet(BaseModel baseModel) {
    setState(() {
      if (itemOncard.length == 1) {
        itemOncard.clear();
      } else {
        itemOncard.removeWhere((element) => element.id == baseModel.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text("My Card",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.verified_user_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
                width: size.width,
                height: size.height * .6,
                child: itemOncard.isNotEmpty
                    ? ListView.builder(
                        itemCount: itemOncard.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var list = itemOncard[index];
                          return FadeInUp(
                            delay: Duration(milliseconds: 100 * index + 80),
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: size.width,
                              height: size.height * .25,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      width: size.width * .4,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(list.imageUrl)),
                                          boxShadow: const [
                                            BoxShadow(
                                              color:
                                                  Color.fromARGB(61, 0, 0, 0),
                                              blurRadius: 4,
                                              offset: Offset(0,
                                                  4), // changes position of shadow
                                            )
                                          ]),
                                    ),
                                    SizedBox(
                                      height: size.height * .01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: size.width * .52,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  list.name,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      onDelet(list);
                                                    },
                                                    icon:
                                                        const Icon(Icons.close))
                                              ],
                                            ),
                                          ),
                                          CustomRishText(
                                              text: list.price.toString()),
                                          SizedBox(
                                            height: size.height * .02,
                                          ),
                                          Text(
                                            "Size =${sizes[3]}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 50),
                                            width: size.width * .4,
                                            height: size.height * .04,
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  width: size.width * .065,
                                                  height: size.height * .045,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                      )),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    onTap: () {
                                                      setState(() {
                                                        if (list.value > 1) {
                                                          list.value--;
                                                        } else {
                                                          onDelet(list);
                                                          list.value = 1;
                                                        }
                                                      });
                                                    },
                                                    child: const Icon(
                                                      Icons.remove,
                                                      size: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Text(
                                                        list.value.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  width: size.width * .065,
                                                  height: size.height * .045,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                      )),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    onTap: () {
                                                      setState(() {
                                                        list.value >= 0
                                                            ? list.value++
                                                            : null;
                                                      });
                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      size: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                          );
                        })
                    : const NoItem()),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                width: size.width,
                height: size.height * .36,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    children: [
                      FadeInUp(
                        delay: const Duration(milliseconds: 300),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("promo/Student code or vourchare",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Icon(Icons.arrow_forward_ios_sharp,
                                color: Colors.grey)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      FadeInUp(
                          delay: const Duration(milliseconds: 200),
                          child: CustomRoe(
                              price: calcoratorsubtotal().toDouble(),
                              text: "sub total price")),
                      FadeInUp(
                          delay: const Duration(milliseconds: 450),
                          child: CustomRoe(
                              price: calcoratorshoping(), text: "Shoping")),
                      const Divider(
                        thickness: 4,
                        height: 20,
                        color: kPrimaryColor,
                      ),
                      FadeInUp(
                          delay: const Duration(milliseconds: 450),
                          child: CustomRoe(price: totalprice(), text: "tatal")),
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 40),
                            child: CustomButtom(
                              size: size,
                              text: "Check Out",
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PageCard()));
                              },
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
