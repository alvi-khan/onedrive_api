import 'package:onedrive_api/onedrive_api.dart';

void main() async {
  FolderParams folderParams = FolderParams();
  folderParams.accessToken = "ACCESS_TOKEN";
  folderParams.name = "Test Folder";

  Response response = await createFolder(folderParams);
  if (response.errorMsg != null) {
    throw Exception(response.errorMsg);
  }

  // id of created folder
  String itemId = response.itemId!;
}
