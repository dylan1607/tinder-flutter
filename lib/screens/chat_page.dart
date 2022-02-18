import 'package:flutter/material.dart';
import 'package:tinder_flutter/constants.dart';
import 'package:tinder_flutter/data/chat_json.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Divider(
          thickness: 0.8,
        ),
        // Search toolbar
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search,
                          color: Colors.grey.withOpacity(0.5)))),
            )),
        Divider(
          thickness: 0.8,
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding),
              child: Text(
                "New Matches",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Scroll story lists with avatar //
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: Row(
                    children: List.generate(storiesJson.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: kDefaultPadding),
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              child: Stack(
                                children: [
                                  storiesJson[index]['story']
                                      ? Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.red, width: 3),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                                height: 70,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          storiesJson[index]
                                                              ['img'],
                                                        ),
                                                        fit: BoxFit.cover))),
                                          ),
                                        )
                                      : Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                                height: 65,
                                                width: 65,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          storiesJson[index]
                                                              ['img'],
                                                        ),
                                                        fit: BoxFit.cover))),
                                          ),
                                        ),
                                  if (storiesJson[index]['online'])
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: kPositiveColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 3)),
                                      ),
                                    )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Bottom Stories. Name of the person
                            Container(
                              width: 70,
                              child: Align(
                                child: Text(
                                  storiesJson[index]['name'],
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                )),
            SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                    children: List.generate(userMessages.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: [
                              userMessages[index]['story']
                                  ? Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.red, width: 3),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      userMessages[index]
                                                          ['img'],
                                                    ),
                                                    fit: BoxFit.cover))),
                                      ),
                                    )
                                  : Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                            height: 65,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      userMessages[index]
                                                          ['img'],
                                                    ),
                                                    fit: BoxFit.cover))),
                                      ),
                                    ),
                              if (storiesJson[index]['online'])
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: kPositiveColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 3)),
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        // Bottom Stories. Name of the person
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userMessages[index]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                              width: size.width - 135,
                              child: Text(
                                userMessages[index]['message'] +
                                    " - " +
                                    userMessages[index]['created_at'],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(0.8)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                })))
          ],
        )
      ],
    );
  }
}
