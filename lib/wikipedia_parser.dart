class WikipediaParser {
  String retrieveMostRecentPatch(dynamic jsonData) {
    return jsonData['query']['pages'].values.first['revisions'][0]['user'];
  }

  int retrievePageID(dynamic jsonData) {
    return jsonData['query']['pages'].values.first['pageid'];
  }

  dynamic parseWikipediaJson(dynamic jsonData) {
    return jsonData;
  }
}
