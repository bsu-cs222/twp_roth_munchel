class uriBuilder {
  String beginningUrl =
      'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=';
  String endingUrl = '&rvprop=timestamp|user&rvlimit=4&redirects';
  String userInput = '';
  String finalUrl = '$beginningUrl$userInput$endingUrl';

  String finalUrlBuilder(String input) {
    userInput = input;
    if (userInput != '') {
      return finalUrl;
    } else {
      return 'Not a vaild url';
    }
  }
}
