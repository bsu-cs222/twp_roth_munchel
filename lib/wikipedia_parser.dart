class WikipediaParser {
  String retrieveMostRecentPatch(dynamic jsonData) {
    return jsonData['query']['pages'].values.first['revisions'][0]['user'];
  }
}
