import 'dart:convert';

import 'package:flutter/services.dart';

class AzkarService {
  loadazkar() async {
    final String response = await rootBundle.loadString("assets/jsons/j2.json");
    dynamic json = jsonDecode(response);
    return json;
  }
}
