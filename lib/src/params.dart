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
