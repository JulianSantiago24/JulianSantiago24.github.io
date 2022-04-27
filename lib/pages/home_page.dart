
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_portafolio/utils/constants.dart';
import 'package:flutter_portafolio/utils/global_keys.dart';
import 'package:flutter_portafolio/widgets/about.dart';
import 'package:flutter_portafolio/widgets/carousel/carousel.dart';
import 'package:flutter_portafolio/widgets/header.dart';
import 'package:flutter_portafolio/widgets/projects.dart';
import 'package:flutter_portafolio/widgets/social_media_button.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKeys.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index){
                return headerItems[index].isButton
                    ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                    : ListTile(
                      title: Text(
                        headerItems[index].title,
                        style: TextStyle(
                          color: Colors.white,                          
                        ),
                      ),
                    );
              },
              separatorBuilder: (BuildContext context, int index){
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length
            ),
          )
        ),
      ) ,
      body: Container(        
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Header(),
              ),
              Carousel(),
              SizedBox(
                height: 25.0,
              ),
              AboutSection(),
              SizedBox(
                height: 170.0,
              ),
              ProjectsCard(),
              SizedBox(
                height: 170.0,
              ),
              SocialMediaButton()
            ],
          ),
        ),
      ),

    );
  }
}