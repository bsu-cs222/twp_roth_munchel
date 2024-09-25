class uriBuilder {
  String beginningUrl =
      'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=';
  String endingUrl = '&rvprop=timestamp|user&rvlimit=4&redirects';
  String userInput = '';

  Future<String> finalUrl() async {
    if (userInput == '') {
      return '$beginningUrl$userInput$endingUrl';
    } else {
      return 'Not a vaild url';
    }
  }
}
