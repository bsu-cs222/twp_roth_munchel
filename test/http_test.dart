import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/album.dart';
import 'package:twp_roth_munchel/http_fetcher.dart';
import 'package:twp_roth_munchel/wikipedia_parser.dart';

main() {
  final fetcher = FetchHttp();
  final parser = WikipediaParser();

  test('The soup wikipedia page will be fetched', () async {
    final jsonEncodedResponse = await File('test/soup.json').readAsString();
    Album album = fetcher.fetchAlbum();
    //Tried Something new but i have to go to work;
  });
}
