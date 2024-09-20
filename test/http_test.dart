import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/http_fetcher.dart';
import 'package:http/http.dart' as http;
import 'package:twp_roth_munchel/wikipedia_parser.dart';

main() {
  final fetcher = FetchHttp();
  final parser = WikipediaParser();

  test('The soup wikipedia page will be fetched', () async {
    final response = fetcher.fetchAlbum();
    final jsonDecodedResponse = parser.parse(response);
    expect(jsonDecodedResponse, File('test/soup.json'));
    //this doesn't work to decode it
    //I tried to do something else, it still doesn't work.
  });
}
