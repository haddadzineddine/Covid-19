import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Ctall extends StatefulWidget {
  int td;
  int tr;
  int nd;
  int nc;
  int ti;
  String code;

  String county;

  Ctall({this.td, this.tr, this.nd, this.nc, this.ti, this.county, this.code});
  @override
  _CtallState createState() => _CtallState();
}

class _CtallState extends State<Ctall> {
  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf1 =
        FlutterMoneyFormatter(amount: widget.td.toDouble());
    FlutterMoneyFormatter fmf2 =
        FlutterMoneyFormatter(amount: widget.tr.toDouble());
    FlutterMoneyFormatter fmf3 =
        FlutterMoneyFormatter(amount: widget.nd.toDouble());
    FlutterMoneyFormatter fmf4 =
        FlutterMoneyFormatter(amount: widget.nc.toDouble());
    FlutterMoneyFormatter fmf5 =
        FlutterMoneyFormatter(amount: widget.ti.toDouble());
    return Container(
      child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.purple[900],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'icons/flags/png/' +
                            widget.code.toString().toLowerCase() +
                            '.png',
                        package: 'country_icons',
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        widget.county.toString()[0].toUpperCase() +
                            widget.county
                                .toString()
                                .substring(1, widget.county.toString().length),
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 0.2,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/coronavirus.png',
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'TOTAL INFECTED :  ',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Colors.white),
                      ),
                      Text(
                        fmf5.output.withoutFractionDigits.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 0.2,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            fmf1.output.withoutFractionDigits.toString(),
                            style: TextStyle(
                                fontSize: 23,
                                fontFamily: 'Montserrat',
                                color: Colors.red),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'DEATHS',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            fmf2.output.withoutFractionDigits.toString(),
                            style: TextStyle(
                                fontSize: 23,
                                fontFamily: 'Montserrat',
                                color: Colors.green),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'RECOVERED',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            fmf4.output.withoutFractionDigits.toString(),
                            style: TextStyle(
                                fontSize: 23,
                                fontFamily: 'Montserrat',
                                color: Colors.blue),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'NEW CASES',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            fmf3.output.withoutFractionDigits.toString(),
                            style: TextStyle(
                                fontSize: 23,
                                fontFamily: 'Montserrat',
                                color: Colors.redAccent),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'NEW DEATHS',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  )
                ])),
      ]),
    );
  }
}
/*
  Row(
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
                      widget.numbre.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          color: Colors.white),
                    ),
                  ],
                )
 */
