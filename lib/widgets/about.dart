
import 'package:flutter/rendering.dart';
import 'package:flutter_portafolio/models/carousel_companies_model.dart';
import 'package:flutter_portafolio/utils/constants.dart';
import 'package:flutter_portafolio/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AboutSection extends StatefulWidget {
  
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {

  List<Widget> generateImages(){
    return carouselCompanies
    .map(
      (element) => ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(          
          element.image,
          fit: BoxFit.scaleDown,
          color: Colors.white30,
          width: 200
        ),
      )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildAboutSection(context, kDesktopMaxWidth),
        tablet:  _buildAboutSection(context, kTabletMaxWidth),
        mobile:  _buildAboutSection(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context, double width) {
    final CarouselController _controller = CarouselController();
    var imageSliders = generateImages();
    int _current = 0;
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720
                  ? Axis.horizontal
                  : Axis.vertical,
                children: [
                  SizedBox(height: 30),    
                  Expanded(
                    flex: constraints.maxWidth > 720 ?1 :0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ABOUT",
                          style: GoogleFonts.oswald( 
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.8,
                            fontSize: 18.0
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '"Soy Ingeniero Electrónico, especializado en gerencia\ny negocios digitales. He trabajado en las industrias\nde telecomunicaciones y software, actualmente soy\ndesarrollador Flutter, si deseas conocer más sobre\nmi experiencia profesional te invito a descargar mi\nCurriculum"',
                          style: GoogleFonts.oswald( 
                            color: kCaptionColor,
                            height: 1.5,                       
                            fontSize: 16.0
                          ),
                        ),
                        SizedBox(height: 15),
                        _downloadCv() , 
                        SizedBox(height: 15),                 
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    flex: constraints.maxWidth > 720 ?1 :0,
                    child: CarouselSlider(
                      items: imageSliders, 
                      options: CarouselOptions(
                        scrollPhysics: PageScrollPhysics(),                      
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 17/7,
                        onPageChanged: (index, reason){
                          setState(() {
                            _current = index;
                            for (int i = 0; i < carouselCompanies.length; i++) {
                              carouselCompanies[i].isSelected = (i == index) ? true: false;
                            }        
                          });
                        }                      
                      ),
                      carouselController: _controller,
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _downloadCv() {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
      height: 30.0,
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "DESCARGAR CV",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}