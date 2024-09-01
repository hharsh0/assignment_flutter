enum FileType {
  pdf,
  xls,
}

class DocumentItem {
  final String title;
  final String lastDateOpened;
  final FileType type;

  DocumentItem({
    required this.title,
    required this.lastDateOpened,
    required this.type,
  });
}
