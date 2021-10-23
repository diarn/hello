import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String heartKey = '';
  String partnerHeartKey = '';
  List<AnimatedText> texts = [
    TypewriterAnimatedText('Hello world!'),
    TypewriterAnimatedText('this is me, Diar'),
    TypewriterAnimatedText(
        "i just want you to know, that i really love you, it's impossible to me to make you sad, mad, or hurt, but i am afraid about tomorrow cause i didn't know how the road leads me to treat you later, if i do anything wrong to you, i hope you tell something i have did to you, so i can know the mistake and try to avoid that thing again, and i can be the decent man for you"),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.green[200],
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: Container()),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Your Heart Key')),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.green[300],
                          ),
                          child: Center(
                            child: Text(heartKey),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 14,
                          child: InkWell(
                            onTap: () {
                              print('bismillah');
                            },
                            child: Icon(
                              FluentIcons.copy_20_filled,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: size.width / 4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                              'https://bain.design/wp-content/uploads/2013/03/People-Avatar-Set-Rectangular-13.jpg'),
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
                      AnimatedTextKit(animatedTexts: texts),
                      Flexible(child: Container()),
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
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'Masukkan pesan kamu untuk dia...'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green[300],
                            ),
                            child: Icon(FluentIcons.send_20_filled),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
