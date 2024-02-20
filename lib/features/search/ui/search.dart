import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/home/data/app_data.dart';
import 'package:shop_app/features/search/ui/widget/is_search.dart';
import 'package:shop_app/features/search/ui/widget/no_item.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    itemonsearch = mainlist;
  }

  onSearch(String search) {
    setState(() {
      itemonsearch = mainlist
          .where((element) => element.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return GestureDetector(
      // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  FadeIn(
                    delay: const Duration(milliseconds: 350),
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.07,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _controller.clear();
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  setState(() {
                                    itemonsearch = mainlist;
                                  });
                                },
                                icon: const Icon(Icons.close)),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20)),
                        controller: _controller,
                        onChanged: (value) => onSearch(value),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Expanded(
                      child: itemonsearch.isNotEmpty
                          ? ScreenIsSearch(size: size, theme: theme)
                          : const NoItem()),
                ],
              )),
        ),
      ),
    );
  }
}
