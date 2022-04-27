
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_portafolio/models/carousel_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_portafolio/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
   (index) => CarouselItemModel(
      text: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "¡Te doy la bienvenida!",
              style:GoogleFonts.oswald(
                color: kPrimaryColor,
                fontWeight: FontWeight.w800,
                fontSize: 19.0,
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            Text(
              "JULIAN\nJARAMILLO",
              style:GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 40.0,
                height: 1.3
              ),
            ),
            Text(
              "Flutter Developer",
              style: TextStyle(
                color: kCaptionColor,
                fontSize: 15.0,
                height: 1.0,
              ),
            ),
            SizedBox(
            height: 25.0,
          ),
          Container(
            height: 0.5,
            width: 500,
            color: kPrimaryColor,
          )
            // MouseRegion(
            //   cursor: SystemMouseCursors.click,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: kPrimaryColor,
            //       borderRadius: BorderRadius.circular(15.0),
            //     ),
            //     height: 30.0,
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 28.0,
            //     ),
            //     child: TextButton(
            //       onPressed: () {},
            //       child: Text(
            //         "GET STARTED",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 13.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      image: Container(
        child: Image.asset(
          "mano.png",
          fit: BoxFit.scaleDown,
        ),
      ),
    )
  );