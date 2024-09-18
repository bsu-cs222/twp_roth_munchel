import 'package:flutter_test/flutter_test.dart';
import 'package:twp_roth_munchel/link.dart';

void main() {
  final counter = WordCounter();
  test(0, () => counter.countWords(''));
}
