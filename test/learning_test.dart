import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('I can read data from the test directory', () async {
    final message = await File('test/message.txt').readAsString();
    expect(message, 'Hello, world');
  });

  test('I can pull the name of the most recent editor', () async {
    final jsonEncodedResponse = await File('test/soup.json').readAsString();
    final object = jsonDecode(jsonEncodedResponse);
    final firstEditor =
        object['query']['pages']['19651298']['revisions'][0]['user'];
    expect(firstEditor, 'Patch23');
  });
}
