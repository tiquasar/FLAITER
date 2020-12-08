import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flaiter/models/slider_development_page.dart';
import 'package:flaiter/widgets/slider_development_page.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: introSlider.length,
            itemBuilder: (context, index) {
              return IntroSlider(
                  imagePath: introSlider[index].imagePath,
                  title: introSlider[index].title,
                  description: introSlider[index].description);
            }),
        bottomSheet: currentIndex != introSlider.length - 1
            ? Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                height: Platform.isIOS ? 80.0 : 60.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            pageController.animateToPage(introSlider.length - 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear);
                          },
                          child:
                              Text('Skip', style: TextStyle(fontSize: 18.0))),
                      Row(children: <Widget>[
                        for (int i = 0; i < introSlider.length; i++)
                          currentIndex == i
                              ? pageIndexIndicator(true)
                              : pageIndexIndicator(false)
                      ]),
                      InkWell(
                          onTap: () {
                            pageController.animateToPage(currentIndex + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear);
                          },
                          child: Text('Next', style: TextStyle(fontSize: 18.0)))
                    ]))
            : Container(
                color: Colors.white,
                margin: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: Platform.isIOS ? 50.0 : 30.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Material(
                        color: Color(0xFF4299E1),
                        child: InkWell(
                            onTap: () => Navigator.pushNamed(context, '/home'),
                            child: SizedBox(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                    child: Text('Get Started',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            letterSpacing: 1.0)))))))));
  }
}
