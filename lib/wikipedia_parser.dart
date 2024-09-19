class WikipediaParser {
  String parse(dynamic jsonData) {
    return jsonData['query']['pages'].values.first['revisions'][0]['user'];
  }
}
