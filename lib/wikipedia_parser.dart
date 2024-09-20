class WikipediaParser {
  String editorName(dynamic jsonData) {
    return jsonData['query']['pages'].values.first['revisions'][0]['user'];
  }

  int searchID(dynamic jsonData) {
    return jsonData['query']['pages'].values.first['pageid'];
  }
}
