class RevisionParser {
  String revision = '';

  theRevision() {
    revision;
  }

  String makeRevison(String revision) {
    revision = revision;
    return revision;
  }

  Future<String> futureRevision(searchTerm) async {
    String revision = await Future.value(searchTerm);
    return revision;
  }
}
