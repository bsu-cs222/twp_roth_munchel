import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchHttp {
  Future<Album> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://en.wikipedia.org/wiki/Soup'));
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}

class Album {
  final int userId;
  final int id;
  final String name;

  const Album({
    required this.userId,
    required this.id,
    required this.name,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(
          userId: userId,
          id: id,
          name: title,
        ),
      _ => throw const FormatException('Failed to load album'),
    };
  }
}
