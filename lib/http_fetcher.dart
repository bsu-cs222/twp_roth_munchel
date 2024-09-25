import 'package:http/http.dart' as http;

class FetchHttp {
  String fetchSoupPage(String url) {
    String httpEncodedResponse = http.read(Uri.parse(url)) as String;
    return httpEncodedResponse;
  }
}
