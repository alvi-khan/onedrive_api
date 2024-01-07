enum DriveType { user, drive, group, site }

class Params {
  DriveType? drive;
  String? driveId;
  String? accessToken;
}

class FolderParams extends Params {
  String? name;
  String? itemId;
  String? itemPath;
}
