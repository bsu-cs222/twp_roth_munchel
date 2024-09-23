import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/album.dart';
import 'package:twp_roth_munchel/http_fetcher.dart';
import 'package:http/http.dart' as http;

main() {
  final fetcher = FetchHttp();

  test('The soup wikipedia page will be fetched', () async {
    final fetchedSoup = fetcher.fetchAlbum();
    final response =
        await http.get(Uri.parse('https://en.wikipedia.org/wiki/Soup'));
    dynamic soupAlbum = Album.fromJson(response.body as Map<String, dynamic>);
    expect(fetchedSoup, soupAlbum);
    //The request is going through, but mapping the response to album
    //is what needs to be done next. Try to figure out how to make our album
    //exactly like the soup.json file.

    //You can see if you test with coverage
  });
}
