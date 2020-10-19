import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideNavigatorItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function switchItem;
  SideNavigatorItem(this.item, this.switchItem);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        item['isChoose']
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
              ),
        SizedBox(
          height: 15.0,
        ),
        GestureDetector(
          onTap: () => switchItem(item['id']),
          child: Text(
            item['text'],
            style: item['isChoose']
                ? GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D),
                    fontSize: 18.0,
                  )
                : GoogleFonts.bigShouldersText(
                    color: Color(0xFFA59FB0),
                    fontSize: 18.0,
                  ),
          ),
        )
      ],
    );
  }
}
