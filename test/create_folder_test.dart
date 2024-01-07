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
      expect(response.itemId, isNotNull);
      expect(response.errorMsg, isNull);

      response = await createFolder(folderParams);
      expect(response.itemId, isNull);
      expect(response.errorMsg, isNotNull);
    });
  });
}
