import 'dart:convert';
import 'package:app_doa/doa/ModelDoa.dart';
import 'package:http/http.dart' as http;

class ServicesDoa {
  static const String url = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';
  static Future<List<DoaDetail>?> getDoa() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<DoaDetail>? list = parseDoa(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<DoaDetail>? parseDoa(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<DoaDetail>((json) => DoaDetail.fromJson(json)).toList();
  }
}
