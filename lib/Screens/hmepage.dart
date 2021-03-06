import 'package:covid19/Services/covidservice.dart';
import 'package:covid19/Widgets/Banner.dart';
import 'package:flutter/material.dart';
import 'package:covid19/models/covid-19.dart';

import 'LoadingPage.dart';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/global.png',
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'Global Statistics ',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            child: FutureBuilder<List<CoronaVirus>>(
              future: CovidService().getDataGlobal(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return (ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, int index) {
                        return Column(
                          children: <Widget>[
                            Ct(
                              txt: 'Infected',
                              c: Color(0xff0f4c75),
                              image: 'coronavirus.png',
                              numbre: snapshot.data[index].total_cases,
                              today: snapshot.data[index].total_new_cases_today,
                            ),
                            Ct(
                              txt: 'Deaths',
                              c: Color(0xff84142d),
                              image: 'death.png',
                              numbre: snapshot.data[index].total_deaths,
                              today:
                                  snapshot.data[index].total_new_deaths_today,
                            ),
                            Ct(
                              txt: 'Recovered',
                              c: Color(0xff278ea5),
                              image: 'recover.png',
                              numbre: snapshot.data[index].total_recovered,
                              today: snapshot.data[index].total_serious_cases,
                            ),
                          ],
                        );
                      }));
                } else {
                  return Loading();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
