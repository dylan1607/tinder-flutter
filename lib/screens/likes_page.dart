import 'package:flutter/material.dart';
import 'package:tinder_flutter/constants.dart';
import 'package:tinder_flutter/data/likes_json.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({Key key}) : super(key: key);

  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(),
      bottomSheet: buildFooter(),
    );
  }

  // Build body
  Widget buildBody() {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.only(bottom: 120),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("10 likes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("Top Picks",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 0.8,
        ),
        Wrap(
            // spacing: 5,
            // runSpacing: 5,
            children: List.generate(likesJson.length, (index) {
          // Frame outside
          return Container(
            padding: EdgeInsets.all(2),
            width: (size.width) / 2,
            height: 250,
            // Colapse image and info
            child: Stack(
              children: [
                // Generate image
                Container(
                    width: (size.width) / 2,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(likesJson[index]['img']),
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  width: size.width / 2,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0)
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      likesJson[index]['active']
                          // if Active true ==>
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kPositiveColor)),
                                  SizedBox(width: 5),
                                  Text(
                                    "Active",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          // If not active ==>
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey)),
                                  SizedBox(width: 5),
                                  Text(
                                    "Offline",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  )
                                ],
                              ),
                            )
                    ],
                  ),
                )
              ],
            ),
          );
        })),
      ],
    );
  }

  // Build Footer for Likes Page
  Widget buildFooter() {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Container(
              width: size.width - 70,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  kButtonColor1,
                  kButtonColor2,
                ]),
              ),
              child: Center(
                child: Text(
                  "SEE WHO LIKES YOU",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
