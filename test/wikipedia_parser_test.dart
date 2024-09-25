import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/wikipedia_parser.dart';

void main() {
  final parser = WikipediaParser();

  test('Patch23 made the most recent edit to the Soup page', () async {
    // Given...
    final jsonObject = await _loadSampleData('soup.json');

    // When...
    final changeRecord = parser.parse(jsonObject);

    // Then ...
    expect(changeRecord.user, 'Patch23');
  });

  test('The most recent change to Soup was made on 2024-08-12T14:06:36Z',
      () async {
    final jsonObject = await _loadSampleData('soup.json');
    WikipediaChange record = parser.parse(jsonObject);
    DateTime expected = DateTime.parse('2024-08-12T14:06:36Z');
    expect(record.timestamp, expected);
  });
}

dynamic _loadSampleData(String testFileName) async {
  final jsonEncodedResponse = await File('test/$testFileName').readAsString();
  return jsonDecode(jsonEncodedResponse);
}
