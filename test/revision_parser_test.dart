import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/revison_parser.dart';

main() {
  final revision = RevisionParser();
  test('The word will be changed', () {
    String word = "Cat";
    word = revision.makeRevision('Dog');
    expect(word, 'Dog');
  });

  test('The link will include soup', () {
    String soup = revision.makeRevision('Soup');
    String link =
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=$soup&rvprop=timestamp|user&rvlimit=4&redirects';
    expect(link,
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=Soup&rvprop=timestamp|user&rvlimit=4&redirects');
  });
}
