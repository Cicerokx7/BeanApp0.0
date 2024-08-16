import 'package:bean_app_0/data/tempDataBase.dart';
import "package:flutter/material.dart";

import '../pages/editCupPage.dart';
import 'cupCard.dart';

class ItemGrid extends StatelessWidget {
  final String title;
  final Function() toggleExpand;
  final int stacki;
  final TempDataBase box;
  late var stack;

  ItemGrid({
    super.key,
    required this.title,
    required this.toggleExpand,
    required this.box,
    required this.stacki,
  }) {
    if (stacki == 0) {
      stack = box.tempList[0];
    } else if (stacki == 1) {
      stack = box.tempList[1];
    } else {
      stack = box.tempList[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Standard
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              GestureDetector(
                onTap: () {
                  toggleExpand();
                },
                child: Text(
                  "shrink",
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: GridView.builder(
                itemCount: stack.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditCupPage(
                                    originalCup: stack[index % 7],
                                    box: box,
                                  )),
                        );
                      },
                      child: CupCard(
                        data: stack[index % 7],
                        size: 1,
                      ));
                })),
      ],
    );
  }
}
