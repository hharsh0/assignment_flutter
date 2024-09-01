import 'package:flutter/material.dart';
import 'package:project/models/document_item.dart';
import 'package:project/data/dummy.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF26292d),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: documentItems.length,
                  itemBuilder: (context, index) {
                    final doc = documentItems[index];

                    return ListTile(
                      leading: Image.asset(
                        doc.type == FileType.pdf ? 'assets/pdf.png' : 'assets/xls.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        doc.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Opened ${doc.lastDateOpened}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
