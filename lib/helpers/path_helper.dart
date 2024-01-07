import '../src/params.dart';

String generateUserPath(Params params) {
  if (params.drive == "user") return "users/${params.driveId}/drive/";
  if (params.drive == "drive") return "drives/${params.driveId}/";
  if (params.drive == "group") return "groups/${params.driveId}/drive/";
  if (params.drive == "site") return "sites/${params.driveId}/drive/";
  return "me/drive/";
}

String formatItemPath(String itemPath) {
  if (itemPath == "/") {
    return "root";
  }

  if (itemPath[0] == '/') {
    itemPath = itemPath.substring(1);
  }

  if (itemPath[itemPath.length - 1] == '/') {
    itemPath = itemPath.substring(0, itemPath.length - 1);
  }

  return "root:/$itemPath:";
}
