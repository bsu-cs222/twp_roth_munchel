class WikipediaParser {
  WikipediaChange parse(dynamic jsonData) {
    String user =
        jsonData['query']['pages'].values.first['revisions'][0]['user'];
    DateTime timestamp = DateTime.parse(
        jsonData['query']['pages'].values.first['revisions'][0]['timestamp']);
    return WikipediaChange(user: user, timestamp: timestamp);
  }
}

class WikipediaChange {
  final String user;
  final DateTime timestamp;
  WikipediaChange({required this.user, required this.timestamp});
}
