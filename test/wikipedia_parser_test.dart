import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/wikipedia_parser.dart';

void main() {
  test('Patch23 made the most recent edit to the Soup page', () async {
    final jsonEncodedResponse = await File('test/soup.json').readAsString();
    final jsonObject = jsonDecode(jsonEncodedResponse);
    final parser = WikipediaParser();
    final editorName = parser.parse(jsonObject);
    expect(editorName, 'Patch23');
  });

  test('GreenC bot made the most recent edit to the Ball State page', () async {
    final jsonEncodedResponse = await File('test/bsu.json').readAsString();
    final jsonObject = jsonDecode(jsonEncodedResponse);
    final parser = WikipediaParser();
    final editorName = parser.parse(jsonObject);
    expect(editorName, 'GreenC bot');
  });
}
