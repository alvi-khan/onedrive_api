import 'package:dotenv/dotenv.dart';
import 'package:onedrive_api/onedrive_api.dart';
import 'package:test/test.dart';

void main() async {
  var env = DotEnv()..load();
  String accessToken = env['ACCESS_TOKEN']!;
  group('Create Folder Tests', () {
    test('Random folder at root', () async {
      FolderParams folderParams = FolderParams();
      folderParams.accessToken = accessToken;
      folderParams.name = "Test Folder";

      Response response = await createFolder(folderParams);
      expect(response.statusCode, 201);
      expect(response.itemId, isNotNull);
      expect(response.errorMsg, isNull);

      String createdItem = response.itemId!;

      response = await createFolder(folderParams);
      expect(response.statusCode, 409);
      expect(response.itemId, isNull);
      expect(response.errorMsg, isNotNull);

      folderParams.itemId = createdItem;
      response = await delete(folderParams);
      expect(response.statusCode, 204);
    });
  });
}
