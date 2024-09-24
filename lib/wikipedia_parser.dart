class WikipediaParser {
  String retrieveMostRecentPatch(dynamic jsonData) {
    String mostRecentEditor =
        jsonData['query']['pages'].values.first['revisions'][0]['user'];
    return mostRecentEditor;
  }
}
