import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/album.dart';
import 'package:twp_roth_munchel/http_fetcher.dart';
import 'package:twp_roth_munchel/wikipedia_parser.dart';
import 'package:http/http.dart' as http;

main() {
  final fetcher = FetchHttp();
  final parser = WikipediaParser();

  test('The soup wikipedia page will be fetched', () async {
    final jsonEncodedResponse =
        await http.get(Uri.parse('https://en.wikipedia.org/wiki/Soup'));
    final parsedData = parser.parseWikipediaJson(jsonEncodedResponse);
    final album = Album.fromJson(parsedData);
    expect(album, parsedData.readAsString);
    //Try to figure out hpw to map response to Map<String,dynamic>
  });
}
