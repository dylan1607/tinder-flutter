import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tinder_flutter/constants.dart';
import 'package:tinder_flutter/screens/account_page.dart';
import 'package:tinder_flutter/screens/chat_page.dart';
import 'package:tinder_flutter/screens/explore_page.dart';
import 'package:tinder_flutter/screens/likes_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: buildBody());
  }

  Widget buildAppBar() {
    var items = [
      pageIndex == 0
          ? "assets/icons/explore_active_icon.svg"
          : "assets/icons/explore_icon.svg",
      pageIndex == 1
          ? "assets/icons/likes_active_icon.svg"
          : "assets/icons/likes_icon.svg",
      pageIndex == 2
          ? "assets/icons/chat_active_icon.svg"
          : "assets/icons/chat_icon.svg",
      pageIndex == 3
          ? "assets/icons/account_active_icon.svg"
          : "assets/icons/account_icon.svg",
    ];
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding / 2, right: kDefaultPadding / 2),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                return IconButton(
                    onPressed: () {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    icon: SvgPicture.asset(items[index]));
              })),
        ));
  }

  // Direct to different pages - IndexedStack
  Widget buildBody() {
    return IndexedStack(
      index: pageIndex,
      children: [ExplorePage(), LikesPage(), ChatPage(), AccountPage()],
    );
  }
}
