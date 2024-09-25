import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/revision_parser.dart';

main() {
  test('The word will be changed', () {
    final revision = RevisionParser();
    String word = "Cat";
    word = revision.makeRevison('Dog');
    expect(word, 'Dog');
  });
}
