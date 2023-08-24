import 'dart:convert';

import 'package:covid_tracker/Models/world_states_model.dart';
import 'package:covid_tracker/Services/Utilities/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  Future<WorldStatesModel> fetchWorldStatsRecords() async {
    final response = await http.get(Uri.parse(AppURL.worldStatesApi));

    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      debugPrint('ABAY SAALE $data');

      var mapData = WorldStatesModel.fromMap(data);
      debugPrint('ABAY SAALE1 $mapData');

      return mapData;
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> fetchCountriesList() async {
    final response = await http.get(
      Uri.parse(AppURL.countriesList),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Origin-Allow-Methods": "GET, DELETE, HEAD, OPTIONS, POST",
        'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
      },
    );

    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      debugPrint('ABAY SAALE $data');
      return data;
    } else {
      throw Exception('error');
    }
  }
}
