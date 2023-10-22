import 'dart:math';
import 'package:myflutterapp/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';

// ignore: must_be_immutable
class ItemSliderWidget extends StatelessWidget {
  BookModel book;
  ItemSliderWidget({super.key, required this.book});

  Map<int, Color> colors = const {
    1: Color(0xfff1bc3a),
    2: Color(0xfff6a670),
    3: Color(0xb3ff7243),
    4: Color(0xffc74904),
    5: Color(0xff8d3c18),
    6: Color(0xfff39614),
    7: Color(0xff724a3e),
    8: Color(0xffc7b619),
    9: Color(0xffdc9439),
    10: Color(0xffa28b02),
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    int index = Random().nextInt(10) + 1;
    return Container(
      width: pyth * 0.25,
      margin: EdgeInsets.only(right: 16.0, top: pyth * 0.042),
      child: Column(
        children: [
          Container(
            width: pyth * 0.25,
            height: pyth * 0.19,
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: pyth * 0.028,
                  child: Container(
                    height: pyth * 0.195,
                    width: pyth * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.black30,
                          blurRadius: 12,
                          offset: const Offset(4, 4),
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(book.image),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  book.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                    color:AppTheme.black100,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  book.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.black30,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}