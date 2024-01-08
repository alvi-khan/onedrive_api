import 'package:onedrive_api/onedrive_api.dart';

void main() async {
  // creating a folder

  FolderParams folderParams = FolderParams();
  folderParams.accessToken = "ACCESS_TOKEN";
  folderParams.name = "Test Folder";

  Response response = await createFolder(folderParams);
  if (response.statusCode != 201) {
    throw Exception(response.errorMsg);
  } else {
    print("Item Created: ${response.itemId}");
  }

  // deleting the folder

  ItemParams itemParams = ItemParams();
  itemParams.accessToken = "ACCESS_TOKEN";
  itemParams.itemId = response.itemId;

  response = await delete(itemParams);
  if (response.statusCode != 204) {
    throw Exception(response.errorMsg);
  } else {
    print("Item Deleted: ${itemParams.itemId}");
  }
}
