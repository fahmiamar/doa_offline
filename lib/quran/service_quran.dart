// ignore_for_file: non_constant_identifier_names, library_prefixes

import 'dart:convert';
import 'package:app_doa/quran/model_quran.dart';
import 'package:flutter/services.dart' as rootBundle;

class ServicesQuran {
  Future<List<QuranDetail>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/quran.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => QuranDetail.fromJson(e)).toList();
  }
}
