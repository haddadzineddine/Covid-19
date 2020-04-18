import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Ct extends StatefulWidget {
  String txt = '';
  int numbre = 0;
  String image = '';
  Color c;
  int today;

  Ct({this.txt, this.c, this.image, this.numbre, this.today});
  @override
  _CtState createState() => _CtState();
}

class _CtState extends State<Ct> {
  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: widget.numbre.toDouble());

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: widget.c,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.txt,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          color: Colors.white),
                    ),
                    widget.txt != 'Recovered'
                        ? Row(
                            children: <Widget>[
                              Icon(
                                Icons.trending_up,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'Today',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                '+' + widget.today.toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white),
                              )
                            ],
                          )
                        : Text(''),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/' + widget.image),
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      fmf.output.withoutFractionDigits.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
