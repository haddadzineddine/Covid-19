import 'package:covid19/Screens/LoadingPage.dart';
import 'package:covid19/Screens/SpalchScreen.dart';
import 'package:covid19/Screens/hmepage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Screens/allcountries.dart';
import 'Screens/fpage.dart';
import 'Screens/home.dart';
import 'Screens/map.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = PageController(initialPage: 1);

  WebViewController _myController;

  int page = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff121212),
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

/*

 */

/*

 */
