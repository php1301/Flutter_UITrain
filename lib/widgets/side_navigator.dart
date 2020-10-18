import 'package:UITrain/widgets/side_navigator_item.dart';
import 'package:flutter/material.dart';

class SideNavigator extends StatefulWidget {
  final mediaHeight;
  final mediaWidth;
  final List<Map<String, dynamic>> navigateItems;

  SideNavigator(this.mediaHeight, this.mediaWidth, this.navigateItems);

  @override
  _SideNavigatorState createState() => _SideNavigatorState();
}

class _SideNavigatorState extends State<SideNavigator> {
  @override
  Widget build(BuildContext context) {
    print(widget.navigateItems[0]['text']);
    return Positioned(
      top: 75.0,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
            width: widget.mediaWidth - 100.0,
            height: widget.mediaHeight / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widget.navigateItems.isEmpty == false
                    ? ListView.builder(
                        itemBuilder: (ctx, i) {
                          return Column(
                            children: [
                              SideNavigatorItem(widget.navigateItems[i]),
                              SizedBox(
                                height: 5.0,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(widget.navigateItems[i]['text']),
                              )
                            ],
                          );
                        },
                        itemCount: widget.navigateItems.length,
                      )
                    : Text('none'),
              ],
            )),
      ),
    );
  }
}
