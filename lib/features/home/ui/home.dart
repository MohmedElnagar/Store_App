import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/constans.dart';
import 'package:shop_app/features/card/ui/card.dart';
import 'package:shop_app/features/search/ui/search.dart';
import 'package:shop_app/features/home/ui/widget/home_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearching = false;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: const Text(
                  'Search',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            : FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: const Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: isSearching
                ? const Icon(
                    Icons.search_off,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Color.fromARGB(255, 2, 0, 0),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const PageCard();
              }));
            },
          ),
        ],
      ),
      body: isSearching ? const Search() : const HomePage(),
      bottomNavigationBar: BottomBarBubble(
        color: kPrimaryColor,
        selectedIndex: _index,
        onSelect: (int index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomBarItem(
            iconData: Icons.home,
          ),
          BottomBarItem(iconData: Icons.search),
          BottomBarItem(iconData: Icons.shopping_cart),
          BottomBarItem(iconData: Icons.settings),
          BottomBarItem(iconData: Icons.mail),
        ],
      ),
    );
  }
}
