# OneDrive API

[![pub package](https://img.shields.io/pub/v/onedrive_api)](https://pub.dev/packages/onedrive_api)

OneDrive API allows easy interaction with the [files APIs of Microsoft Graph](https://learn.microsoft.com/en-us/graph/api/resources/onedrive). It follows the [OneDrive API module for NodeJS](https://www.npmjs.com/package/onedrive-api).

This library is exclusively for the files APIs. For other Microsoft APIs, check out [microsoft_graph_api](https://pub.dev/packages/microsoft_graph_api).

> Note: Using this library requires an [access token](https://learn.microsoft.com/en-us/graph/auth-v2-user).

## Features
- [x] Create Folders
- [ ] Create Shareable Links
- [ ] Delete Files and Folders
- [ ] Download Files and Folders
- [ ] Fetch Metadata
- [ ] List Files and Folders
- [ ] Retrieve File Preview URLs
- [ ] Retrieve File Thumbnails
- [ ] Update Metadata
- [ ] Upload Files

## Usage

### Creating a Folder

```dart
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

```