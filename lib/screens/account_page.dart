import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:tinder_flutter/data/account_json.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.6,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 10),
        ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/user.JPG'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              accountInfo[0]['name'] + ", " + accountInfo[0]['age'],
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Setting button
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 10,
                                color: Colors.grey.withOpacity(0.1))
                          ]),
                      child: Icon(Icons.settings,
                          size: 35, color: Colors.grey.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "SETTINGS",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                // Media Button
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Container(
                        width: 85,
                        height: 85,
                        child: Stack(
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.red,
                                    Colors.red.withOpacity(0.6)
                                  ]),
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 15,
                                        spreadRadius: 10,
                                        color: Colors.grey.withOpacity(0.1))
                                  ]),
                              child: Icon(Icons.camera_alt,
                                  size: 45, color: Colors.white),
                            ),
                            // Plus icon
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ADD MEDIA",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.withOpacity(0.8),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                // Edit button
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 10,
                                color: Colors.grey.withOpacity(0.1))
                          ]),
                      child: Icon(Icons.edit,
                          size: 35, color: Colors.grey.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "EDIT",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
