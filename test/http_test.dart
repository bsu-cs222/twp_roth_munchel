import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/http_fetcher.dart';
import 'package:http/http.dart' as http;

main() {
  final fetcher = FetchHttp();

  test('The soup wikipedia page will be fetched', () async {
    dynamic fetchedSoup = await fetcher.fetchSoupPage();
    dynamic httpEncodedResponse =
        await http.get(Uri.https('en.wikipedia.org/wiki/Soup'));
    dynamic httpRead = http.read(httpEncodedResponse);
    expect(fetchedSoup, httpRead);
  });
}
