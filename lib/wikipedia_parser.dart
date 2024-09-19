class WikipediaParser {
  String parser(dynamic jsonData) {
    return jsonData['query']['pages'].values.first['revisions']['user'][0]
        ['user'];
  }
}
