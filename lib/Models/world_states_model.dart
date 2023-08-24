import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WorldStatesModel {
  int updated;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  double testsPerOneMillion;
  int population;
  int oneCasePerPeople;
  int oneDeathPerPeople;
  int oneTestPerPeople;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;
  int affectedCountries;
  WorldStatesModel({
    required this.updated,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
    required this.affectedCountries,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'updated': updated,
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'todayDeaths': todayDeaths,
      'recovered': recovered,
      'todayRecovered': todayRecovered,
      'active': active,
      'critical': critical,
      'casesPerOneMillion': casesPerOneMillion,
      'deathsPerOneMillion': deathsPerOneMillion,
      'tests': tests,
      'testsPerOneMillion': testsPerOneMillion,
      'population': population,
      'oneCasePerPeople': oneCasePerPeople,
      'oneDeathPerPeople': oneDeathPerPeople,
      'oneTestPerPeople': oneTestPerPeople,
      'activePerOneMillion': activePerOneMillion,
      'recoveredPerOneMillion': recoveredPerOneMillion,
      'criticalPerOneMillion': criticalPerOneMillion,
      'affectedCountries': affectedCountries,
    };
  }

  factory WorldStatesModel.fromMap(Map<String, dynamic> map) {
    debugPrint("object");
    return WorldStatesModel(
      updated: map['updated'] as int,
      cases: map['cases'] as int,
      todayCases: map['todayCases'] as int,
      deaths: map['deaths'] as int,
      todayDeaths: map['todayDeaths'] as int,
      recovered: map['recovered'] as int,
      todayRecovered: map['todayRecovered'] as int,
      active: map['active'] as int,
      critical: map['critical'] as int,
      casesPerOneMillion: map['casesPerOneMillion'] as int,
      deathsPerOneMillion: map['deathsPerOneMillion'] as double,
      tests: map['tests'] as int,
      testsPerOneMillion: map['testsPerOneMillion'] as double,
      population: map['population'] as int,
      oneCasePerPeople: map['oneCasePerPeople'] as int,
      oneDeathPerPeople: map['oneDeathPerPeople'] as int,
      oneTestPerPeople: map['oneTestPerPeople'] as int,
      activePerOneMillion: map['activePerOneMillion'] as double,
      recoveredPerOneMillion: map['recoveredPerOneMillion'] as double,
      criticalPerOneMillion: map['criticalPerOneMillion'] as double,
      affectedCountries: map['affectedCountries'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorldStatesModel.fromJson(String source) {
    debugPrint("object");
    debugPrint(json.decode(source));
    return WorldStatesModel.fromMap(
        json.decode(source) as Map<String, dynamic>);
  }
}
