import './home_route.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      title: Text(
        '\nObject Detection',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      image: Image.asset('assets/flower.png'),
      photoSize: 50.0,

      gradientBackground: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.004, 1],
        colors: GradientColors.aqua,
      ),
      loaderColor: Colors.lightBlueAccent.shade100,
    );
  }
}
