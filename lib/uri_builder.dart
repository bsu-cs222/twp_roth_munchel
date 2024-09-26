class UriBuilder {
  String beginningUrl =
      'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=';
  String endingUrl = '&rvprop=timestamp|user&rvlimit=4&redirects';
  String userInput = '';

  String finalUrlBuilder(String input) {
    userInput = input;
    String finalUrl = '$beginningUrl$userInput$endingUrl';
    if (userInput != '') {
      return finalUrl;
    } else {
      return 'Not a vaild url';
    }
  }
}
