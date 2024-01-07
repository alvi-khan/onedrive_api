import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onedrive_api/helpers/config.dart';

Future<http.Response> post(
  String endpoint,
  String accessToken,
  Map<String, dynamic> jsonData,
) {
  Uri url = Uri.parse("$apiUrl$endpoint");

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': "Bearer $accessToken",
  };

  return http.post(
    url,
    headers: headers,
    body: jsonEncode(jsonData),
  );
}
