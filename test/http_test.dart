import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/http_fetcher.dart';
import 'package:http/http.dart' as http;

main() {
  final fetcher = FetchHttp();

  test('The soup wikipedia page will be fetched', () async {
    dynamic fetchedSoup = await fetcher.fetchSoupPage(
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=Biden&rvprop=timestamp|user&rvlimit=4&redirects');
    dynamic httpEncodedResponse =
        await http.get(Uri.https('en.wikipedia.org/wiki/Soup'));
    dynamic httpRead = http.read(httpEncodedResponse);
    expect(fetchedSoup, httpRead);
  });
}
