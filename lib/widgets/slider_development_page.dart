import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flaiter/models/slider_development_page.dart';

class IntroSlider extends StatelessWidget {
  final String imagePath, title, description;
  final List<IntroSliderModel> introSlider;
  IntroSlider({this.imagePath, this.title, this.description, this.introSlider});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(imagePath,
                  height: size.width * .5, width: size.width * .5),
              SizedBox(height: 30.0),
              Text(title,
                  style: TextStyle(
                      fontSize: size.width * .06, fontWeight: FontWeight.bold)),
              SizedBox(height: 30.0),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(description,
                      style: TextStyle(fontSize: size.width * .04)))
            ]));
  }
}
