import 'package:UITrain/constants/color_palette.dart';
import 'package:UITrain/widgets/filtered_items.dart';
import 'package:UITrain/widgets/side_navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final colorPallete = ColorPalette();
  final List<Map<String, dynamic>> _navigateItems = [
    {
      'id': 1,
      'text': 'GoldBrew',
      'isChoose': true,
      'url': 'assets/coffee1.png',
      'price': '150',
      'desc': 'Fantastic brew',
      'reviews': 21,
      'starCount': 4.0,
      'color': ColorPalette().firstSlice,
    },
    {
      'id': 2,
      'text': 'McCafe',
      'isChoose': false,
      'url': 'assets/coffee2.png',
      'price': '200',
      'desc': 'You won\'t forget this',
      'reviews': 3,
      'starCount': 3.0,
      'color': ColorPalette().secondSlice,
    },
    {
      'id': 3,
      'text': 'NesCafe',
      'isChoose': false,
      'url': 'assets/coffee3.png',
      'price': '299',
      'desc': 'Give it a try!',
      'reviews': 15,
      'starCount': 3.5,
      'color': ColorPalette().firstSlice,
    },
    {
      'id': 4,
      'text': 'Cold Brew',
      'isChoose': false,
      'url': 'assets/coffee4.png',
      'price': '399',
      'desc': 'Just say yes',
      'reviews': 69,
      'starCount': 5.0,
      'color': ColorPalette().secondSlice,
    },
    {
      'id': 5,
      'text': 'Black Gold',
      'isChoose': false,
      'url': 'assets/coffee1.png',
      'price': '499',
      'desc': 'Here we go',
      'reviews': 12,
      'starCount': 2.0,
      'color': ColorPalette().firstSlice,
    },
  ];
  int get _choosedIndex {
    return _navigateItems.indexWhere((element) => element['isChoose'] == true);
  }

  void _switchItem(int id) {
    setState(() {
      _navigateItems[_choosedIndex]['isChoose'] = false;
      int newIndex =
          _navigateItems.indexWhere((element) => element['id'] == id);
      _navigateItems[newIndex]['isChoose'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
          ),
          Container(
            width: screenWidth / 5,
            height: screenHeight,
            color: colorPallete.leftBarColor,
          ),
          Positioned(
            left: screenWidth / 5,
            child: Container(
              height: screenHeight,
              width: screenWidth - (screenWidth / 5),
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 35.0,
            left: 20.0,
            child: Icon(Icons.shopping_cart),
          ),
          Positioned(
            top: 100.0,
            left: screenWidth / 5 + 25,
            child: Column(
              children: [
                Text(
                  'Coffee House',
                  style: GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D),
                    fontSize: 40,
                  ),
                ),
                Text(
                  'Best place to find your favorite coffee',
                  style: GoogleFonts.bigShouldersText(
                    color: Color(0xFFA59F80),
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: screenWidth - screenWidth / 5 - 50.0,
                  height: 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Search...',
                        hintStyle: GoogleFonts.bigShouldersText(
                          color: Color(0xFFA59FB0),
                          fontSize: 15.0,
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.withOpacity(0.4),
                        )),
                  ),
                )
              ],
            ),
          ),
          SideNavigator(
            _navigateItems,
            _switchItem,
          ),
          FilteredItems(
            _navigateItems[_choosedIndex],
            screenWidth,
            screenHeight,
          )
        ],
      ),
    );
  }
}
