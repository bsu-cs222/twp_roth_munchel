import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/link.dart';

main() {
  final adder = LinkMaker();

  String f =
      'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=&rvprop=timestamp|user&rvlimit=4&redirects';
  String k = adder.linkAdder('');
  test(('Link will include no title'), () {
    expect(k, f);
  });
}
