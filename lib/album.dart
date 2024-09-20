class Album {
  final String user;
  final int pageId;
  final String name;

  const Album({
    required this.user,
    required this.pageId,
    required this.name,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': String user,
        'pageId': int pageId,
        'title': String title,
      } =>
        Album(
          user: user,
          pageId: pageId,
          name: title,
        ),
      _ => throw const FormatException('Failed to load album'),
    };
  }
}
