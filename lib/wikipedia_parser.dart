class WikipediaParser {
  String parse(dynamic jsonData) {
    return jsonData['query']['pages'].values['revisions'][0]['user'];
  }
}
