import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tinder_flutter/constants.dart';
import 'package:tinder_flutter/data/explore_json.dart';
import 'package:tinder_flutter/data/icons_json.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List itemsTemp = [];
  int itemLength = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      itemsTemp = exploreJson;
      itemLength = exploreJson.length;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomSheet: buildFooter(),
    );
  }

  Widget buildBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: Container(
        height: size.height,
        child: TinderSwapCard(
          totalNum: itemLength,
          maxWidth: size.width,
          maxHeight: size.height * 0.75,
          minWidth: size.width * 0.75,
          minHeight: size.height * 0.6,
          cardBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                  )
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // colapse image and text
                child: Stack(
                  children: [
                    Container(
                        width: size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(itemsTemp[index]['img']),
                                fit: BoxFit.cover))),
                    Container(
                        width: size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.black.withOpacity(0)
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: size.width * 0.7,
                                        child: Column(
                                          children: [
                                            // Info bottom card
                                            Row(
                                              children: [
                                                // Name and Age
                                                Text(itemsTemp[index]['name'],
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                SizedBox(width: 10),
                                                Text(itemsTemp[index]['age'],
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                // Current Status
                                                Container(
                                                  height: 10,
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kPositiveColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: kDefaultPadding / 2),
                                                Text(
                                                    itemsTemp[index]
                                                        ['activities'],
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    )),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            // Generate tag list
                                            Row(
                                              children: List.generate(
                                                  itemsTemp[index]['likes']
                                                      .length, (indexLikes) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      //outline border
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: Colors.white
                                                          .withOpacity(0.2),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left:
                                                            kDefaultPadding / 2,
                                                        top: kDefaultPadding *
                                                            0.3,
                                                        right:
                                                            kDefaultPadding / 2,
                                                        bottom:
                                                            kDefaultPadding *
                                                                0.3,
                                                      ),
                                                      child: Text(
                                                          itemsTemp[index]
                                                                  ['likes']
                                                              [indexLikes],
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          ],
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          width: size.width * 0.7,
                                          child: Center(
                                              child: Icon(
                                            Icons.info,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                        ))
                                  ],
                                )
                              ]),
                        ))
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget buildFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            bottom: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconsJson.length, (index) {
            return Container(
              width: iconsJson[index]['size'],
              height: iconsJson[index]['size'],
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10)
                  ]),
              child: Center(
                child: SvgPicture.asset(
                  iconsJson[index]['icon'],
                  width: iconsJson[index]['icon_size'],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
