
import 'dart:math';
import 'package:flutter_portafolio/models/cardInfo_model.dart';
import 'package:flutter_portafolio/utils/constants.dart';
import 'package:flutter_portafolio/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsCard extends StatefulWidget {

  @override
  State<ProjectsCard> createState() => _ProjectsCardState();
}

class _ProjectsCardState extends State<ProjectsCard> {

  double _middleAreaHeight;
  double _outsideCardInterval;
  double scrollOffsetY;
  //double _insideCardInterval;
  List<CardInfo> _cardInfoList;

  @override
  void initState() {
    super.initState();

    _middleAreaHeight    = 330.0;
    _outsideCardInterval = 30.0;
    scrollOffsetY        = 0;
    
    _cardInfoList = [
      CardInfo(
        projectName: "APP - CARRITO DE COMPRAS",
        imageName: 'carrito.png',
        leftColor: kPrimaryColor,
        rightColor: kBackgroundColor
      ),
      CardInfo(
        projectName: "PORTAFOLIO",
        imageName: 'portafolio.png',
        leftColor: kPrimaryColor,
        rightColor: kBackgroundColor
      ),      
      CardInfo(
        projectName: "PAGINA WEB CAFÉ",
        imageName: 'cafe.png',
        leftColor: kPrimaryColor,
        rightColor: kBackgroundColor
      ),      
      CardInfo(
        projectName: "PAGINA WEB CAFÉ 3",
        imageName: 'cafe.png',
        leftColor: kPrimaryColor,
        rightColor: kBackgroundColor
      ),
    ];

    for (var i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[i];
      if(i == 0){
        cardInfo.postionY = 100;
        cardInfo.opacity  = 1.0;
        cardInfo.scale    = 1.0;
        cardInfo.rotate   = 1.0;
      } else {
        cardInfo.postionY = 330 + ( i - 1) * 50.0;
        cardInfo.opacity  = 0.7 - ( i - 1) * 0.1;
        cardInfo.scale    = 0.9;
        cardInfo.rotate   = -60;
      }
    }

    _cardInfoList = _cardInfoList.reversed.toList();
  }


  _buildCards(){

    List widgetList = [];

    for (CardInfo cardInfo in _cardInfoList) {
      widgetList.add(
        Positioned(
          top: cardInfo.postionY,
          child: Transform(            
            transform: Matrix4.identity()
            ..setEntry(3,2,0.001)
            ..rotateX(pi / 180 * cardInfo.rotate)
            ..scale(cardInfo.scale),
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: cardInfo.opacity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.white30,
                      BlendMode.modulate,
                    ),
                    image: AssetImage(cardInfo.imageName),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end:  Alignment.centerRight,
                    colors: [
                      cardInfo.leftColor,
                      cardInfo.rightColor,
                    ]
                  )
                ),        
                padding: EdgeInsets.all(40.0),
                width: 420,
                height: 220,
                //color: Colors.white30,
                child: Stack(              
                  children: [           
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: Text(
                        cardInfo.projectName,
                        style: GoogleFonts.oswald( 
                          color: Colors.white,
                          height: 1.5,                       
                          fontSize: 23.0,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    Positioned( 
                      bottom: 0,
                      right: 10,                 
                      child: FloatingActionButton(
                        mini: true,  
                        backgroundColor: Colors.white10,
                        elevation: 50.0,
                        tooltip: "Ir al repositorio del proyecto",                  
                        onPressed: (){},
                        child: Image.asset(
                          "github.png",        
                          fit: BoxFit.scaleDown,
                          color: Colors.white,
                          //width: 50
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      );
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildProjectsCard(context, kDesktopMaxWidth, _cardInfoList),
        tablet:  _buildProjectsCard(context, kTabletMaxWidth, _cardInfoList),
        mobile:  _buildProjectsCard(context, getMobileMaxWidth(context), _cardInfoList),
      ),
    );
  }

  _updateCardPosition(double offsetY){

    void updatePosition(CardInfo cardInfo, double firstCardAtAreaIdx, int cardIdx){
    
      double currentCardAtAreaIdx = firstCardAtAreaIdx + cardIdx;

      if(currentCardAtAreaIdx < 0){
        cardInfo.postionY = 100 + currentCardAtAreaIdx * _outsideCardInterval;
        
        cardInfo.rotate = -90.0 / _outsideCardInterval * (100 - cardInfo.postionY);
        if (cardInfo.rotate > 0.0 ) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -90.0) cardInfo.rotate = -90.0;

        cardInfo.scale = 1.0 - 0.2 / _outsideCardInterval * (100 - cardInfo.postionY);
        if (cardInfo.scale < 0.8 ) cardInfo.scale = 0.8;
        if (cardInfo.scale > 1.4 ) cardInfo.scale = 1.4;

        cardInfo.opacity = 1.0 - 0.7/ _outsideCardInterval * (100 - cardInfo.postionY);
        if (cardInfo.opacity  < 0.0 ) cardInfo.opacity = 0.0;
        if (cardInfo.opacity  > 1.0 ) cardInfo.opacity = 1.0;

      } else if (currentCardAtAreaIdx >= 0 && currentCardAtAreaIdx < 1.4){
        cardInfo.postionY = 100 + currentCardAtAreaIdx * _middleAreaHeight;

        cardInfo.rotate = -60.0 / (400 * (cardInfo.postionY -100)) ;
        if (cardInfo.rotate > 0.0 ) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -60.0) cardInfo.rotate = -60.0;

        cardInfo.scale = 1.0 - 0.1 / 400 * (cardInfo.postionY - 100);
        if (cardInfo.scale < 0.9 ) cardInfo.scale = 0.9;
        if (cardInfo.scale > 1.4 ) cardInfo.scale = 1.4;

        cardInfo.opacity = 1.0 - 0.3/ 400 * (cardInfo.postionY - 100);
        if (cardInfo.opacity  < 0.0 ) cardInfo.opacity = 0.0;
        if (cardInfo.opacity  > 1.0 ) cardInfo.opacity = 1.0;

      } else if (currentCardAtAreaIdx >= 1.4){
        cardInfo.postionY = 500 + (currentCardAtAreaIdx - 1) * _outsideCardInterval;
        
        cardInfo.rotate = -60.0;
        cardInfo.scale  = 0.9;
        cardInfo.opacity  = 0.7 - cardIdx * 0.1;
      }
    }

    scrollOffsetY += offsetY;
    double firstCardAtAreaIdx = scrollOffsetY / _middleAreaHeight;
    print(firstCardAtAreaIdx);

    

    for (var i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[_cardInfoList.length - 1 - i];
      updatePosition(cardInfo, firstCardAtAreaIdx, i);
    }
    setState(() {});
  }

  _buildProjectsCard(BuildContext context, double width, _cardInfoList) {
    return   Center(
      child: GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails d){
          //print(d.delta.dy);
          _updateCardPosition(d.delta.dy);
        },
        onVerticalDragEnd: (DragEndDetails d){
          
          scrollOffsetY = (scrollOffsetY/_middleAreaHeight).round()*_middleAreaHeight;
          _updateCardPosition(0);

        },
        child: Container(
          //color: Colors.white12,
          width: width,
          //width: MediaQuery.of(context).size.width,
          height: 670,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "PORTAFOLIO",
                  style: GoogleFonts.oswald( 
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 18.0
                  ),
                ),
              ),
              // Positioned(
              //   top: 100,
              //   child: Container(
              //     color: Colors.green,
              //     width: width,
              //     height: 1,
              //   )
              // ),
              // Positioned(
              //   bottom: 100,
              //   child: Container(
              //     color: Colors.blue,
              //     width: width,
              //     height: 1,
              //   )
              // ),
              ..._buildCards()
            ],
          ),
        ),
      ),
    );
  }
}

