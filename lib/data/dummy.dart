
import 'package:project/models/document_item.dart';

  List<DocumentItem> get documentItems => [
        DocumentItem(
          title: '100 Martinique Ave Title',
          lastDateOpened: 'Dec 4, 2023',
          type: FileType.pdf,
        ),
        DocumentItem(
          title: 'Chase Bank Statement - 2023',
          lastDateOpened: 'Dec 3, 2023',
          type: FileType.pdf,
        ),
        DocumentItem(
          title: 'Backyard Remodel Renderings',
          lastDateOpened: 'Nov 11, 2023',
          type: FileType.xls,
        ),
      ];