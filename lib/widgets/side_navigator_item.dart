import 'package:flutter/material.dart';

class SideNavigatorItem extends StatefulWidget {
  final Map<String, dynamic> item;
  SideNavigatorItem(this.item);

  @override
  _SideNavigatorItemState createState() => _SideNavigatorItemState();
}

class _SideNavigatorItemState extends State<SideNavigatorItem> {
  @override
  Widget build(BuildContext context) {
    return widget.item['isChecked']
        ? Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF23163D),
            ),
          )
        : Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
          );
  }
}
