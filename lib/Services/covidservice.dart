import 'dart:async';
import 'dart:convert';
import 'package:covid19/models/covid-19.dart';
import 'package:http/http.dart' as http;

class CovidService {
  Future<List<CoronaVirus>> getData() async {
    final res = await http
        .get('https://api.thevirustracker.com/free-api?countryTotals=ALL');
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      dynamic dt = data['countryitems'][0];
      List<CoronaVirus> coronaVirus = [];
      for (var i = 1; i <= 182; i++) {
        CoronaVirus cv = CoronaVirus(
            dt['$i']['code'].toString().toLowerCase(),
            dt['$i']['title'].toString().toLowerCase(),
            dt['$i']['total_cases'],
            dt['$i']['total_recovered'],
            dt['$i']['total_unresolved'],
            dt['$i']['total_deaths'],
            dt['$i']['total_new_cases_today'],
            dt['$i']['total_new_deaths_today'],
            dt['$i']['total_active_cases'],
            dt['$i']['total_serious_cases']);
        coronaVirus.add(cv);
      }
      return coronaVirus;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<CoronaVirus>> getDataAlgeria() async {
    final res = await http
        .get('https://api.thevirustracker.com/free-api?countryTotals=ALL');

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      dynamic dt = data['countryitems'][0];
      List<CoronaVirus> coronaVirus = [];

      CoronaVirus cv = CoronaVirus(
          dt['3']['code'],
          dt['3']['title'],
          dt['3']['total_cases'],
          dt['3']['total_recovered'],
          dt['3']['total_unresolved'],
          dt['3']['total_deaths'],
          dt['3']['total_new_cases_today'],
          dt['3']['total_new_deaths_today'],
          dt['3']['total_active_cases'],
          dt['3']['total_serious_cases']);
      coronaVirus.add(cv);

      return coronaVirus;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<CoronaVirus>> getDataGlobal() async {
    final res =
        await http.get('https://api.thevirustracker.com/free-api?global=stats');

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      dynamic dt = data['results'][0];
      List<CoronaVirus> coronaVirus = [];

      CoronaVirus cv = CoronaVirus(
          '',
          'World',
          dt['total_cases'],
          dt['total_recovered'],
          dt['total_unresolved'],
          dt['total_deaths'],
          dt['total_new_cases_today'],
          dt['total_new_deaths_today'],
          dt['total_active_cases'],
          dt['total_serious_cases']);
      coronaVirus.add(cv);

      return coronaVirus;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<CoronaVirus>> Search(String s) async {
    final res = await http
        .get('https://api.thevirustracker.com/free-api?countryTotals=ALL');
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      dynamic dt = data['countryitems'][0];
      List<CoronaVirus> coronaVirus = [];
      for (var i = 1; i <= 182; i++) {
        CoronaVirus cv = CoronaVirus(
            dt['$i']['code'].toString().toLowerCase(),
            dt['$i']['title'].toString().toLowerCase(),
            dt['$i']['total_cases'],
            dt['$i']['total_recovered'],
            dt['$i']['total_unresolved'],
            dt['$i']['total_deaths'],
            dt['$i']['total_new_cases_today'],
            dt['$i']['total_new_deaths_today'],
            dt['$i']['total_active_cases'],
            dt['$i']['total_serious_cases']);

        if (cv.code.contains(s.toLowerCase()) ||
            cv.title.contains(s.toLowerCase())) {
          coronaVirus.add(cv);
        } else {
          if (s.isEmpty) {
            coronaVirus.add(cv);
          }
        }
      }
      return coronaVirus;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
