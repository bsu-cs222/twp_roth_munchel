class WikipediaParser {
  String retrieveMostRecentPatch(dynamic jsonData) {
    return jsonData['query']['pages'].values.first['revisions'][0]['user'];
  }

  int retrievePageID(dynamic jsonData) {
    return jsonData['query']['pages'].values.first['pageid'];
  }

  String parseWikipediaJson(dynamic jsonData) {
    return jsonData['query']['pages'].values.first;
  }
}
