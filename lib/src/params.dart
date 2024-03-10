enum DriveType { user, drive, group, site }

class Params {
  DriveType? drive;
  String? driveId;
  String? accessToken;
}

class ItemParams extends Params {
  String? itemId;
  String? itemPath;
}

class FolderParams extends ItemParams {
  String? name;
}

class UploadParams extends Params {
  String? filename;
  String? parentId;
  String? parentPath;
  String? filepath;
}
