import 'package:http/http.dart' as http;

class FetchHttp {
  Future<String> fetchSoupPage() async {
    final response =
        await http.get(Uri.parse('https://en.wikipedia.org/wiki/Soup'));
    if (response.statusCode == 200) {
      dynamic httpEncodedResponse =
          http.read(Uri.parse('https://en.wikipedia.org/wiki/Soup'));
      return httpEncodedResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
