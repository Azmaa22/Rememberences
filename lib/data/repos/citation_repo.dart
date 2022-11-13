import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_apps/data/models/citation_model.dart';

Future<Map<String, dynamic>> getAllCitations() async {
  final String response =
      await rootBundle.loadString('assets/static_data/db.json');
  Map<String, dynamic> azkar = jsonDecode(response);
  return azkar;
}

dynamic getCurrentCitation({required String citation}) async {
  dynamic temp = await getAllCitations();
  List<Citation> currentCitations = [];
  currentCitations = temp[citation]!
      .map<Citation>(
        (citation) => Citation.fromJson(citation),
      )
      .toList();
  return currentCitations;
}
