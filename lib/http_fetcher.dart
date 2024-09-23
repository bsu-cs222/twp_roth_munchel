import 'dart:convert';
import 'package:http/http.dart' as http;
import 'album.dart';

class FetchHttp {
  Future<Album> fetchAlbum(String link) async {
    link = 'https://en.wikipedia.org/wiki/Soup';
    final response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
