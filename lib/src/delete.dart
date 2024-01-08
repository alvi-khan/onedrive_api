import 'dart:convert';

import 'package:onedrive_api/helpers/path_helper.dart';
import 'package:onedrive_api/src/params.dart';
import 'package:onedrive_api/helpers/http_helper.dart' as http;

import 'core.dart';

Future<Response> delete(ItemParams params) async {
  if (params.accessToken == null) {
    throw Exception("Missing params.accessToken");
  }

  if (params.itemId == null && params.itemPath == null) {
    throw Exception("Missing both params.itemId and params.itemPath");
  }

  String? itemAddress;
  if (params.itemId != null) {
    itemAddress = "items/${params.itemId}";
  } else {
    itemAddress = formatItemPath(params.itemPath!);
  }

  String userPath = generateUserPath(params);
  String endpoint = "$userPath$itemAddress";

  var response = await http.delete(endpoint, params.accessToken!);
  if (response.statusCode == 204) {
    return Response(response.statusCode, null, null);
  }
  return Response.fromJson(response.statusCode, jsonDecode(response.body));
}
