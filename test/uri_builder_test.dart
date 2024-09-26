import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/revison_parser.dart';
import 'package:twp_roth_munchel/uri_builder.dart';

main() {
  test('The link to Soup we be built', () async {
    final revison = RevisionParser();
    final soup = await revison.futureRevision();
    final uribuilder = uriBuilder();
    final uri = uribuilder.finalUrlBuilder('Lebron');
    expect(uri,
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=Lebron&rvprop=timestamp|user&rvlimit=4&redirects');
  });
}
