import 'package:UITrain/screens/coffee_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FilteredItems extends StatelessWidget {
  final Map<String, dynamic> item;
  final mediaHeight;
  final mediaWidth;
  FilteredItems(this.item, this.mediaWidth, this.mediaHeight);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: mediaHeight / 3 + 5.0,
      left: mediaWidth / 5 + 25.0,
      height: mediaHeight - mediaHeight / 3 + 50.0,
      width: mediaWidth - (mediaWidth / 5 + 50.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: 300.0,
              width: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
            ),
            Positioned(
              top: 100.0,
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/doodle.png'), fit: BoxFit.none),
                ),
              ),
            ),
            Positioned(
              top: 100.0,
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
            Positioned(
              top: 100.0,
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: item['color'].withOpacity(0.9),
                ),
              ),
            ),
            Positioned(
              right: -15.0,
              child: Hero(
                tag: item['url'],
                child: Container(
                  width: 250.0,
                  height: 200,
                  child: Image(
                    image: AssetImage(
                      item['url'],
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 125.0,
              left: 15.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D),
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '\$${item['price']}',
                    style: GoogleFonts.bigShouldersText(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '${item['desc']}',
                    style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D),
                      fontSize: 27.0,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    width: 200.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item['reviews']} Reviews',
                              style: GoogleFonts.bigShouldersText(
                                color: Color(0xFF23163D),
                                fontSize: 22.0,
                              ),
                            ),
                            SmoothStarRating(
                              starCount: 5,
                              size: 17.0,
                              color: Colors.white,
                              borderColor: Colors.white,
                              rating: item['starCount'],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                CoffeeDetails.routeName,
                                arguments: item);
                          },
                          child: Container(
                            width: 75.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Add',
                                  style: GoogleFonts.bigShouldersText(
                                    color: Color(0xFF23163D),
                                    fontSize: 17.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
