import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapCoronaVirus extends StatefulWidget {
  @override
  _MapCoronaVirusState createState() => _MapCoronaVirusState();
}

class _MapCoronaVirusState extends State<MapCoronaVirus> {
  WebViewController _myController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.map,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'Coronavirus Tracker ',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: Container(
            child: WebView(
              initialUrl: 'https://ncov2019.live/map',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _myController = controller;
              },
              onPageFinished: (url) {
                _myController.evaluateJavascript(
                    "document.getElementsByClassName('navbar navbar-expand-lg navbar-dark')[0].style.display='none';"
                    "document.body.style.backgroundColor='#121212';");
              },
            ),
          ),
        ),
      ],
    );
  }
}
