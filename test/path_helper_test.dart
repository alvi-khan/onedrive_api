import 'package:onedrive_api/helpers/path_helper.dart';
import 'package:test/test.dart';

void main() async {
  test('Format Item Paths', () async {
    List<Map<String, String>> tests = [
      {"input": "/", "output": "root"},
      {"input": "path/to/file", "output": "root:/path/to/file:"},
      {"input": "/path/to/file", "output": "root:/path/to/file:"},
      {"input": "/path/to/file/", "output": "root:/path/to/file:"},
    ];

    for (Map<String, String> test in tests) {
      expect(formatItemPath(test["input"]!), equals(test["output"]));
    }
  });
}
