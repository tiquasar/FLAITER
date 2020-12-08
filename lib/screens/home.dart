import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flaiter/models/flaiter_tasks.dart';
import 'package:flaiter/widgets/flaiter_tasks.dart';
import 'package:flutter/cupertino.dart';
import './settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url !';
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        key: _drawerKey,
        appBar: AppBar(
          backgroundColor: Colors.blue,

            title: Text('FLAITER (Flutter & AI)'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                  icon: SvgPicture.asset('assets/icons/settings.svg',
                      color: Colors.white))
            ]),

        body: Padding(
            padding: EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        SizedBox(width: 16.0),
                        Container(
                            height: 80.0,
                            width: 75.0,
                            child: Image.asset('assets/images/robot.png',
                                fit: BoxFit.fill)),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[

                            TextSpan(
                                text: "Made with:",
                                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "\nFlutter",
                                style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold)),

                            TextSpan(
                                text: "\nTensorflow",
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,fontSize: 20)),
                          ]),
                        ),
                      ]),
              SizedBox(height: 20.0),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Greetings from  FL",
                          style: TextStyle(color: Colors.white,fontSize: 25)),
                      TextSpan(
                          text: "AI",
                          style: TextStyle(
                              color: Colors.blue.shade300,
                              fontWeight: FontWeight.bold,fontSize: 25)),
                      TextSpan(
                          text: "TER",
                          style: TextStyle(color: Colors.white,fontSize: 25)),
                      TextSpan(
                          text: "\n(Pronounced as ",
                          style: TextStyle(color: Colors.white60,fontSize: 18)),
                      TextSpan(
                          text: "flighter)",
                          style: TextStyle(color: Colors.white60,fontSize: 18,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                    ]),
                  ),
              SizedBox(height: 20.0),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "\nExplore AI and Machine Learning:",
                          style: TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold)),


                    ]),

                  ),
              SizedBox(height: 40.0),
              Container(
                  height: size.width * .575,
                  width: size.width*0.900,
                  decoration: BoxDecoration(

                      color: Colors.blue.shade300.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: GridView.builder(

                      padding: EdgeInsets.zero,

                      shrinkWrap: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,childAspectRatio: (size.width * 1.875/ size.width)
                      ),
                      itemCount: aiTasks.length,
                      itemBuilder: (context, index) {
                        return AiTasks(
                            icon: aiTasks[index].icon,
                            name: aiTasks[index].name,

                        );
                      }))
            ]))));
  }
}
