import 'package:http/http.dart' as http;

class FetchHttp {
  Future<String> fetchSoupPage(String uri) async {
    Future<String> response = http.read(Uri.parse(uri));
    return response;
    /*  'user-agent'
          'Revision Reporter/0.1 (https://www.cs.bsu.edu/~pvgestwicki/courses/cs222Fa24; cole.munchel@bsu.edu)'
    });
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ('You are not connected to WIFI');
    }*/
  }
}
