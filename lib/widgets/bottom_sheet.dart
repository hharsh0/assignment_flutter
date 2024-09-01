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
        return GestureDetector(
          onVerticalDragUpdate: (details) {
            scrollController.jumpTo(scrollController.offset - details.delta.dy);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF26292d),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Drag handle
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      // Header Container
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Domni docs',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios),
                              color: Colors.white,
                              iconSize: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final doc = documentItems[index];
                      return ListTile(
                        leading: Image.asset(
                          doc.type == FileType.pdf ? 'assets/images/pdf.png' : 'assets/images/xls.png',
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
                    childCount: documentItems.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}