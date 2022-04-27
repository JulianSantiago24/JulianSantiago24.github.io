import 'package:flutter/material.dart';

class CardInfo {
  Color leftColor;
  Color rightColor;
  String imageName;
  String projectName;
  double postionY = 0;
  double rotate = 0;
  double opacity = 0;
  double scale = 0;

  CardInfo({
    this.leftColor,
    this.rightColor,
    this.imageName,
    this.projectName,
    this.postionY,
    this.rotate,
    this.opacity,
    this.scale
  });
}