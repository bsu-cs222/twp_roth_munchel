import 'package:http/http.dart' as http;

class FetchHttp {
  Future<String> fetchSoupPage() async {
    dynamic response = await http.get(Uri.parse(
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=soup&rvprop=timestamp|user&rvlimit=4&redirects'));
    if (response.statusCode == 200) {
      dynamic httpEncodedResponse = http.read(Uri.parse(
          'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=soup&rvprop=timestamp|user&rvlimit=4&redirects'));
      return httpEncodedResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
