import 'package:twp_roth_munchel/revison_parser.dart' as reviser;

class UriBuilder {
  String beginningUrl =
      'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=';
  String endingUrl = '&rvprop=timestamp|user&rvlimit=4&redirects';
  String revision = '';

  Future<String> finalUrl() {
    if (SearchTerm != '') {
      return '$beginningUrl$SearchTerm$endingUrl';
    } else {
      return 'Not a vaild url';
    }
  }
}
