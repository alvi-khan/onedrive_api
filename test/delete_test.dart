import 'package:dotenv/dotenv.dart';
import 'package:onedrive_api/onedrive_api.dart';
import 'package:test/test.dart';

void main() async {
  var env = DotEnv()..load();
  String accessToken = env['ACCESS_TOKEN']!;
  group('Delete Item Tests', () {
    test('Delete Item', () async {
      FolderParams folderParams = FolderParams();
      folderParams.accessToken = accessToken;
      folderParams.name = "Test Folder 2";

      Response response = await createFolder(folderParams);
      expect(response.statusCode, 201);

      folderParams.itemId = response.itemId;
      response = await delete(folderParams);
      expect(response.statusCode, 204);

      response = await delete(folderParams);
      expect(response.statusCode, 404);
      expect(response.errorMsg, isNotNull);
    });
  });
}
