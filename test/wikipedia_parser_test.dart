import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/wikipedia_parser.dart';

main() {
  final parser = WikipediaParser();

  test('Patch23 is the most recent user', () async {
    dynamic jsonEncodedResponse = await File('test/soup.json').readAsString();
    dynamic jsonDecoded = jsonDecode(jsonEncodedResponse);
    String editorName = parser.retrieveMostRecentPatch(jsonDecoded);
    int pageId = parser.retrievePageID(jsonDecoded);
    expect(editorName, 'Patch23');
    expect(pageId, 19651298);
  });
}
