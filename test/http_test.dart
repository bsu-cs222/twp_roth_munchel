import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/http_fetcher.dart';
import 'package:http/http.dart' as http;
import 'package:twp_roth_munchel/wikipedia_parser.dart';

main() {
  test('The soup wikipedia page will be fetched', () async {
    final fetcher = FetchHttp();
    final parser = WikipediaParser();
    final response = fetcher.fetchAlbum();
    final JsonEncodedResponse = parser.parse(response);
    await http.get(Uri.parse('https://en.wikipedia.org/wiki/Soup'));
    final JsonDecodedResponse = jsonDecode(JsonEncodedResponse) as String;
    print(JsonDecodedResponse);
    //this doesn't work to decode it
  });
}
