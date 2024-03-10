import 'dart:convert';
import 'dart:io';

import 'package:onedrive_api/helpers/config.dart';
import 'package:onedrive_api/helpers/path_helper.dart';
import 'package:onedrive_api/src/params.dart';
import 'package:http/http.dart' as http;

 // * @param {NodeJS.ReadableStream} params.readableStream Readable Stream with file's content
 // * @return {Promise<Object>} Item
Future<void> uploadSimple(UploadParams params) async {
  if (params.accessToken == null) {
    throw Exception("Missing params.accessToken");
  }

  if (params.filename == null) {
    throw Exception("Missing params.filename");
  }

  if (params.filepath == null) {
    throw Exception("Missing params.filepath");
  }

  // const passThroughStream = PassThrough();
  // params.readableStream.pipe(passThroughStream);
  
  // Workaround for a "'"  in a filename OData issue https://github.com/OneDrive/onedrive-api-docs/issues/565
  // params.filename = params.filename.replace("'", "''");

  params.parentId = params.parentId ?? "root";
  String userPath = generateUserPath(params);
  String endpoint = "${userPath}items/${params.parentId!}/children('${params.filename!}')/content";
  
  if (params.parentPath != null) {
    String parentPath = formatItemPath(params.parentPath! + params.filename!);
    endpoint = "$userPath$parentPath/content";
  }

  Uri url = Uri.parse("$apiUrl$endpoint");

  Map<String, String> headers = {
    'Authorization': "Bearer ${params.accessToken}"
  };

  final file = File(params.filepath!);
  final fileLength = await file.length();

  var request = http.MultipartRequest('PUT', url);
  request.headers.addAll(headers);
  request.files.add(http.MultipartFile(
      'file',
      file.openRead(),
      fileLength,
      filename: params.filename!,
  ));

  var response = await request.send();

  // var response = await http.post(endpoint, params.accessToken!, passThroughStream) // do not encode?
  var responseBody = await response.stream.bytesToString();
  print(jsonDecode(responseBody));
// const response = await gotExtend.put(uri);
// return response.body;
}
