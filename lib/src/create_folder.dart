import 'dart:convert';

import 'package:onedrive_api/helpers/http_helper.dart';
import 'package:onedrive_api/helpers/path_helper.dart';
import 'package:onedrive_api/src/params.dart';

import 'core.dart';

Future<Response> createFolder(FolderParams params) async {
  if (params.accessToken == null) {
    throw Exception("Missing params.accessToken");
  }

  if (params.name == null) {
    throw Exception("Missing params.name");
  }

  String itemAddress = "items/root";

  if (params.itemId != null) {
    itemAddress = "items/${params.itemId}";
  }

  if (params.itemPath != null) {
    itemAddress = "items/${formatItemPath(params.itemPath!)}";
  }

  String userPath = generateUserPath(params);
  String endpoint = "$userPath$itemAddress/children";

  Map<String, dynamic> jsonData = {
    "name": params.name,
    "folder": {},
  };

  var response = await post(endpoint, params.accessToken!, jsonData);
  return Response.fromJson(response.statusCode, jsonDecode(response.body));
}
