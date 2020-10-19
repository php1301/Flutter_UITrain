import 'package:UITrain/widgets/side_navigator_item.dart';
import 'package:flutter/material.dart';

class SideNavigator extends StatelessWidget {
  final List<Map<String, dynamic>> navigateItems;
  final Function switchItem;
  SideNavigator(this.navigateItems, this.switchItem);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 75.0,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
            width: MediaQuery.of(context).size.height - 100.0,
            height: MediaQuery.of(context).size.width / 5,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...navigateItems
                      .map((e) => SideNavigatorItem(e, switchItem))
                      .toList()
                ])),
      ),
    );
  }
}
