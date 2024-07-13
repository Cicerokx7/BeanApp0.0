import 'package:bean_app_0/components/cupCard.dart';
import 'package:bean_app_0/pages/editCupPage.dart';
import "package:flutter/material.dart";
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class ItemRow extends StatelessWidget {
  final stack;

  const ItemRow({super.key, required this.stack});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListWheelScrollViewX.useDelegate(
        scrollDirection: Axis.horizontal,
        itemExtent: 200,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
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
                child: CupCard(data: stack[index % 7], size: 1));
          },
        ),
        // specify the height or width of each item based on the scroll direction,
        // scrollDirection: Axis.horizontal,
      ),
    );
  }
}
