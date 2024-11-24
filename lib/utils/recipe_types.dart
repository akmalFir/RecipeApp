import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<Map<String, String>>> loadRecipeTypes() async {
  final String jsonString =
      await rootBundle.loadString('assets/recipetypes.json');

  final List<dynamic> jsonData = json.decode(jsonString);

  return jsonData
      .map((e) => {"id": e['id'].toString(), "types": e['types'].toString()})
      .toList();
}
