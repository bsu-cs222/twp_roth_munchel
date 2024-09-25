class RevisionParser {
  String revision = '';

  theRevision() {
    revision;
  }

  String makeRevison(String revision) {
    revision = revision;
    return revision;
  }

  Future<String> futureRevision() async {
    String revision = await Future.value(makeRevison(theRevision()));
    return revision;
  }
}
