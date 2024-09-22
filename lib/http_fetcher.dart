import 'dart:convert';
import 'package:http/http.dart' as http;
import 'album.dart';

class FetchHttp {
  Future<Album> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://en.wikipedia.org/wiki/Soup'));
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    else {
      throw Exception('Failed to load album');
    }
  }
}
