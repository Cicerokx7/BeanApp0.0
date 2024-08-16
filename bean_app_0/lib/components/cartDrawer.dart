import 'package:bean_app_0/components/cupCard.dart';
import 'package:bean_app_0/data/tempDataBase.dart';
import 'package:bean_app_0/pages/editCupPage.dart';
import "package:flutter/material.dart";
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class cartDawer extends StatelessWidget {
  final TempDataBase box;

  cartDawer({
    super.key,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    final stack = box.tempList[3];
    return ListView.builder(
      itemCount: stack.length,
      itemBuilder: (context, index) {
        print("test");
        print(stack.length);
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
            child: CupCard(data: stack[index % 7], size: 1));
      },
    );
    // specify the height or width of each item based on the scroll direction,
    // scrollDirection: Axis.horizontal,
  }
}
