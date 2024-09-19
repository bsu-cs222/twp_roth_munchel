class LinkMaker {
  String linkAdder(String f) {
    f = 'Brody';
    String s =
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=$f&rvprop=timestamp|user&rvlimit=4&redirects';
    return s;
  }
}
