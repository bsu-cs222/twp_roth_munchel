class Album {
  final String query;
  final int pages;
  final String revisions;
  final String user;

  const Album({
    required this.query,
    required this.pages,
    required this.revisions,
    required this.user,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'query': String query,
        'pages': int pages,
        'revisions': String revisions,
        'user': String user,
      } =>
        Album(
          query: query,
          pages: pages,
          revisions: revisions,
          user: user,
        ),
      _ => throw const FormatException('Failed to load album'),
    };
  }
}
