import "package:flutter/material.dart";

import '../pages/editCupPage.dart';
import 'cupCard.dart';

class ItemGrid extends StatelessWidget {
  final String title;
  final Function() toggleExpand;
  final stack;

  const ItemGrid({
    super.key,
    required this.title,
    required this.toggleExpand,
    required this.stack,
  });

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
