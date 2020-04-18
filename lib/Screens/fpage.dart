import 'package:flutter/material.dart';

import 'package:covid19/Screens/hmepage.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'allcountries.dart';
import 'home.dart';
import 'map.dart';

class Fpage extends StatefulWidget {
  @override
  _FpageState createState() => _FpageState();
}

class _FpageState extends State<Fpage> {
  final controller = PageController(initialPage: 1);

  int page = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff121212),
        appBar: AppBar(
          backgroundColor: Color(0xff121212),
          elevation: 0.0,
          title: Text(
            'COVID-19',
            style: TextStyle(fontSize: 17, fontFamily: 'Montserrat'),
          ),
        ),
        body: page == 0
            ? PageView(
                controller: controller,
                children: <Widget>[Home(), World()],
              )
            : (page == 1) ? AllCountries() : MapCoronaVirus(),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.transparent,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 22,
            ),
            Icon(
              Icons.flag,
              size: 22,
            ),
            Icon(
              Icons.map,
              size: 22,
            ),
          ],
          animationCurve: Curves.easeOutExpo,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
        ),
      ),
    );
  }
}
