import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/wikipedia_parser.dart';

main() {
  final parser = WikipediaParser();

  test('Patch23 is the most recent user', () async {
    final jsonEncodedResponse = await File('test/soup.json').readAsString();
    final jsonDecoded = jsonDecode(jsonEncodedResponse);
    final editorName = parser.parse(jsonDecoded);
    expect(editorName, 'Patch23');
  });

  test('The PageID is 19651298', () async {
    final jsonEncodedResponse = await File('test/soup.json').readAsString();
    final jsonDecoded = jsonDecode(jsonEncodedResponse);
    final pageId = parser.parse(jsonDecoded);
    expect(pageId, 19651298);
  });
}
