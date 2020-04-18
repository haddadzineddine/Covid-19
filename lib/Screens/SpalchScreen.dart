import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fpage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _item = 0;
  List<String> Title = [
    'Wash Your Hands',
    'Cover your coughs and sneezes',
    'Stay home'
  ];
  List<String> Des = [
    'Wash your hands with soap and running water when hands are visibly dirty  ',
    ' Use a tissue to cover your nose and mouth and throw used tissues in a lined trash can.',
    'Stay home if you can and avoid any non-essential travel. Avoid social gatherings of more than 10 people.',
  ];
  goto() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Fpage()));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Covid$_item.jpg'),
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(4),
                    child: FlatButton(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            color: Color(0xff121212),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Fpage()),
                          );
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius:
                                20.0, // has the effect of softening the shadow
                            spreadRadius:
                                5.0, // has the effect of extending the shadow
                            offset: Offset(
                              10.0, // horizontal, move right 10
                              10.0, // vertical, move down 10
                            ),
                          ),
                        ]),
                        child: Column(
                          children: <Widget>[
                            Text(
                              Title[_item],
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Montserrat',
                                  fontSize: 30,
                                  color: Colors.white,
                                  letterSpacing: 1.2),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                Des[_item],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 19,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      _item == 0
                                          ? Icons.lens
                                          : Icons.panorama_fish_eye,
                                      color: Colors.white,
                                      size: 14.0,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      _item == 1
                                          ? Icons.lens
                                          : Icons.panorama_fish_eye,
                                      color: Colors.white,
                                      size: 14.0,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      _item == 2
                                          ? Icons.lens
                                          : Icons.panorama_fish_eye,
                                      color: Colors.white,
                                      size: 14.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 16, right: 12, left: 12),
                              width: double.infinity,
                              child: FlatButton(
                                color: Colors.lightBlue[700],
                                textColor: Colors.white,
                                disabledColor: Colors.grey,
                                disabledTextColor: Colors.black,
                                padding: EdgeInsets.all(10.0),
                                splashColor: Colors.blueAccent,
                                onPressed: () {
                                  setState(() {
                                    _item == 2 ? goto() : _item++;
                                  });
                                },
                                child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: _item != 2
                                        ? Text(
                                            "Next",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 1.05,
                                            ),
                                          )
                                        : Text(
                                            "Coronavirus Cases",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 1.05,
                                            ),
                                          )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
