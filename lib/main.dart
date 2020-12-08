import 'package:flaiter/hand_gesture_recognition/main.dart';
import 'package:flutter/material.dart';
import 'hand_gesture_recognition/views/home.dart';

import 'package:flaiter/screens/home.dart';
import 'package:flaiter/screens/classification_animals.dart';
import 'package:flaiter/screens/image_classification_task.dart';
import 'package:flaiter/screens/slider_development_page.dart';
import 'package:flaiter/advanced_image_detection/main.dart';
import './splashscreen.dart';
import 'advanced_image_detection/splashscreennn.dart';
import 'package:flaiter/lib_animal/splashscreen_animal.dart';

void main() => runApp(FLAITER());

class FLAITER extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(0xFF4299E1)),
        routes: {
          '/': (context) => HomeScreen() ,
          '/home': (context) => HomeScreen(),
          '/animal_classification_tensorflow': (context) => MySplashe(),
          '/advanced_object_detection':(context) => MySplashp(),
          '/object_detection':(context) => MySplash(),
          '/hand_gesture_recognition':(context) => HomeScreenh(),
          '/image-animals': (context) => ImageAnimalsScreen(),

        });
  }
}
