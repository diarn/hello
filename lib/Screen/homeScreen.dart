import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello/const.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String heartKey = '';
  String partnerHeartKey = '';

  TextEditingController heartKeyController = TextEditingController();
  TextEditingController partnerHeartKeyController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  List<AnimatedText> texts = [
    TypewriterAnimatedText('Hello world!'),
    TypewriterAnimatedText('this is me, Diar'),
    TypewriterAnimatedText(
        "i just want you to know, that i really love you, it's impossible to me to make you sad, mad, or hurt, but i am afraid about tomorrow cause i didn't know how the road leads me to treat you later, if i do anything wrong to you, i hope you tell something i have did to you, so i can know the mistake and try to avoid that thing again, and i can be the decent man for you"),
  ];

  @override
  void initState() {
    _firebaseMessaging
        .getToken()
        .then((value) => heartKeyController.text = value!);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height / 13,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height / 40,
                    // color: Colors.red,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Center(
                            child: Text('Hello'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showD();
                          },
                          child: Icon(FluentIcons.info_20_filled),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(),
          ),
          Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: size.width / 4,
                    width: size.width / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Colors.green[50],
              ),
              child: Column(
                children: [
                  AnimatedTextKit(
                    animatedTexts: texts,
                    isRepeatingAnimation: false,
                  ),
                  Flexible(child: Container()),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Partner Heart Key')),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green[200],
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Please input your partner Heart Key'),
                        controller: partnerHeartKeyController,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.green[200],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: messageController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        "Type your message for your partner"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          send();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green[300],
                          ),
                          child: Icon(FluentIcons.send_20_filled),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  showD() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Your Heart Key'),
          content: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 50,
                ),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.green[300],
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: heartKeyController,
                  ),
                ),
              ),
              Positioned(
                right: 15,
                top: 14,
                child: InkWell(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: heartKeyController.text),
                      );
                      var snackBar = SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Heart Key Copied!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Icon(
                      FluentIcons.copy_20_filled,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        );
      },
    );
  }

  send() async {
    http.Response res = await sendNotification();
    // var jsonData = jsonDecode(res.body);
    print(res.body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      var snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text('Your message have been sent'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(
        backgroundColor: Colors.red[900],
        content: Text('Your message have been sent'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<http.Response> sendNotification() async {
    Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    Map<String, String> headers = {
      'Authorization': serverKey,
      'Content-Tyoe': 'application/json'
    };
    Map<String, dynamic> body = {
      "to": partnerHeartKeyController.text,
      "collapse_key": "type_a",
      "data": {
        "body": "Hello",
        "title": messageController.text,
        "key_1": "Value for key_1",
        "key_2": "Value for key_2"
      }
    };
    return http.post(url, headers: headers, body: jsonEncode(body));
  }
}
