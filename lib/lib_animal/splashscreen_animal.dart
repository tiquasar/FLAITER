import 'package:flaiter/lib_animal/home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashe extends StatefulWidget {
  @override
  _MySplasheState createState() => _MySplasheState();
}

class _MySplasheState extends State<MySplashe> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      title: Text(

        '\nAnimal Classification\nCurrently for 2 labels ( Cat and Dog )',
        style: TextStyle(

          fontWeight: FontWeight.bold,
          fontSize: 40,
          color: Colors.blue,
        ),
      ),
      image: Image.asset('assets/pets.png'),
      photoSize: 40.0,
      backgroundColor: Colors.black,
      loaderColor: Colors.blue,
    );
  }
}
