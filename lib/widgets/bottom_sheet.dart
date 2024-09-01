import 'package:flutter/material.dart';

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
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[
                    ListTile(
                      title: Container(
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
                            )
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/pdf.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      title: const Text('100 Martinique Ave Title',
                          style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Opened Dec 4, 2023',
                          style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/pdf.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      title: const Text('Chase Bank Statement - 2023',
                          style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Opened Dec 3, 2023',
                          style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/xls.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      title: const Text('Backyard Remodel Renderings',
                          style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Opened Nov 11, 2023',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
