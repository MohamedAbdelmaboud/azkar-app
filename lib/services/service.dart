import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sebha/Models/alhusna_model.dart';

class Service {
  Future<List<HusnaModel>> loadJson() async {
    final String response = await rootBundle.loadString("assets/jsons/j1.json");
    List<dynamic> json = jsonDecode(response); // json
    // put json on object !
    List<HusnaModel> Data = List.generate(json.length,
        (index) => HusnaModel.fromJson(json[index]));
    return Data;
  }
}
