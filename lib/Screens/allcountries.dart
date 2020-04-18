import 'package:covid19/Services/covidservice.dart';
import 'package:covid19/Widgets/bannerallcontries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19/models/covid-19.dart';

import 'LoadingPage.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  Future<List<CoronaVirus>> lcv = CovidService().getData();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.flag,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'Country Statistics ',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black54,
          ),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Colors.white),
                  onChanged: (s) {
                    setState(() {
                      lcv = CovidService().Search(s);
                    });
                  },
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: 'Search ',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.white),
                  ),
                ),
              ),
              FlatButton(
                padding: EdgeInsets.only(left: 25),
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: FutureBuilder<List<CoronaVirus>>(
              future: lcv,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return (ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, int index) {
                        return Column(
                          children: <Widget>[
                            Ctall(
                              td: snapshot.data[index].total_deaths,
                              tr: snapshot.data[index].total_recovered,
                              nd: snapshot.data[index].total_new_deaths_today,
                              nc: snapshot.data[index].total_new_cases_today,
                              ti: snapshot.data[index].total_cases,
                              county: snapshot.data[index].title,
                              code: snapshot.data[index].code,
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
