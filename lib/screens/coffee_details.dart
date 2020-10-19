import 'package:UITrain/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetails extends StatefulWidget {
  static const routeName = '/coffee-details';
  CoffeeDetails({Key key}) : super(key: key);

  @override
  _CoffeeDetailsState createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  buildItems(price, color) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: 125.0,
              width: 200.0,
              color: Colors.transparent,
            ),
            Positioned(
              top: 50.0,
              child: Container(
                height: 75.0,
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                      color: Colors.grey.withOpacity(0.2),
                    )
                  ],
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 5.0,
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/coffee3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60.0,
              left: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: GoogleFonts.bigShouldersText(
                      color: color,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    'COLD BREW KIT',
                    style: GoogleFonts.bigShouldersText(
                      color: ColorPalette().firstSlice,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;
    final item =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: mediaHeight,
              width: mediaWidth,
              color: Colors.transparent,
            ),
            Container(
              height: mediaHeight,
              width: mediaWidth,
              color: ColorPalette().leftBarColor,
            ),
            Container(
              height: mediaHeight / 4 + 25.0,
              width: mediaWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/doodle.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: mediaHeight / 2,
              width: mediaWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Container(
              height: mediaHeight / 4 + 25.0,
              width: mediaWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                color: item['color'].withOpacity(0.9),
              ),
            ),
            Positioned(
              top: 35.0,
              left: 20.0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              top: 35.0,
              right: 20.0,
              child: Icon(Icons.shop),
            ),
            Positioned(
              top: mediaHeight / 4 - 100,
              left: mediaWidth / 4,
              child: Hero(
                tag: item['url'],
                child: Image(
                  image: AssetImage(
                    item['url'],
                  ),
                  height: 175.0,
                  width: 175.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: mediaHeight / 4 + 85.0,
              left: mediaWidth / 7,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['text'],
                      style: GoogleFonts.bigShouldersText(
                        color: Color(0xFF23163D),
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.verified_user_outlined),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          item['price'],
                          style: GoogleFonts.bigShouldersText(
                            color: item['color'],
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          width: 1.0,
                          height: 20.0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(Icons.star_border_outlined),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          item['starCount'].toString(),
                          style: GoogleFonts.bigShouldersText(
                            color: item['color'],
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          width: 1.0,
                          height: 20.0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(Icons.comment_bank_outlined),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '${item['reviews']} Reviews',
                          style: GoogleFonts.bigShouldersText(
                            color: item['color'],
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: mediaHeight / 2 + 10.0,
              left: 25.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D),
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: mediaWidth - 40.0,
                    child: Text(
                      item['desc'],
                      style: GoogleFonts.bigShouldersText(
                        color: Color(0xFFB5ABB8),
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 150.0,
                    width: mediaWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildItems('\$65', item['color']),
                        buildItems('\$125', item['color']),
                        buildItems('\$99', item['color']),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: mediaWidth - mediaWidth / 3 - 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorPalette().buttonColor,
                        ),
                        child: Center(
                          child: Text(
                            'BUY NOW',
                            style: GoogleFonts.bigShouldersText(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50.0,
                        width: mediaWidth / 3 - 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorPalette().buttonColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.bookmark_outline,
                            size: 17.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
