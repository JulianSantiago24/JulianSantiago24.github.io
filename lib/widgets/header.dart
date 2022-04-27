
import 'package:flutter_portafolio/models/header_item_model.dart';
import 'package:flutter_portafolio/utils/constants.dart';
import 'package:flutter_portafolio/utils/global_keys.dart';
import 'package:flutter_portafolio/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

List<HeaderItem> headerItems = [
  HeaderItem(title: "HOME", onTap: (){}),
  HeaderItem(title: "ABOUT", onTap: (){}),
  HeaderItem(title: "PORTAFOLIO", onTap: (){}),
  HeaderItem(title: "CONTACT", onTap: (){})
];

class Header extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        mobile: buildMobileHeader(),
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        tablet: buildHeader(),
      ),
    );
  }

  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            GestureDetector(
              onTap: () {
                GlobalKeys.scaffoldKey.currentState.openEndDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 28.0
              ),
            )
          ],
        ),
      )
    );
  } 

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow()
        ],
      ),
    );
  }
}

class HeaderLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: (){},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "JJ",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Flutter",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE)
      ],
      child: Row(
        children: headerItems
          .map(
            (item) => item.isButton
                ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kDangerColor,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5.0
                    ),
                    child: TextButton(
                      onPressed: item.onTap,
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  ),
                )
                : MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    margin: EdgeInsets.only(right: 30.0),
                    child: GestureDetector(
                      onTap: item.onTap,
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
          ).toList(),
      ),
    );
  }
}


