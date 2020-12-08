import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:theme_provider/theme_provider.dart';

class SettingsPage extends StatefulWidget {


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: IconButton(onPressed: () {
          Navigator.pop(context);
          },
              icon: Icon(OMIcons.arrowBackIos,
                  color: Colors.white)),
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

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {

                },
                child: Container(



                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 36, right: 24),
                child: buildHeaderWidget(context),
              ),


              buildCardWidget(Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Text(
                          'DEVELOPER\'S GITHUB PROFILE\n',
                          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20,fontWeight: FontWeight.bold),

                        ),



                      )),
                  Container(
                    alignment: Alignment.center,
                    child: OutlineButton.icon(
                      icon: Icon(OMIcons.link),
                      label: Text('GITHUB',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              color: Colors.white70)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onPressed: openGitHub,

                    ),
                  ),


                  Container(
                    height: 40,
                  ),
                  Center(
                    child: Text('Made With'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1)),
                  ),
                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Text(
                          'Flutter',
                          style: TextStyle(fontFamily: 'Montserrat', fontSize: 24),
                        ),
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: OutlineButton.icon(
                      icon: Icon(OMIcons.link),
                      label: Text('Flutter Website',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              color: Colors.white70)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onPressed: openflutter,
                    ),
                  ),
                  Center(
                    child: Text(' '.toUpperCase(),
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1)),
                  ),
                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Text(
                          'Android Studio',
                          style: TextStyle(fontFamily: 'Montserrat', fontSize: 24),
                        ),
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: OutlineButton.icon(
                      icon: Icon(OMIcons.link),
                      label: Text('AndroidStudio Website',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              color: Colors.white70)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onPressed: openandroidstudio,
                    ),
                  ),


                ],
              )),
              buildCardWidget(Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Review and Bug Reporting',
                      style: TextStyle(
                              letterSpacing: 1,
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          color: Colors.white70)),
                  Text('\nBug reporting through this route is disabled for developer releases of the app.\n',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          color: Colors.red.shade800)),
                  Text('Note: This is a Temporary Workaround, Feel free to Report a Bug on Github(If familiar with Github). ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Colors.black54)),
                  Text('Github Link can be found in About App Section.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Colors.black54)),
                  Text('Note: You need to be signed to your GoogleAccount to report bug and give app review,this helps in keeping track of app review counts and bug reports. ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Colors.black)),
                  Container(
                    height: 40,
                  ),
                  Center(
                    child: Text('Report The Bugs Here'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1)),
                  ),

                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Text(
                          'Report The Bug',
                          style: TextStyle(fontFamily: 'Montserrat', fontSize: 24),

                        ),



                      )),
                  Container(
                    alignment: Alignment.center,
                    child: OutlineButton.icon(
                      icon: Icon(OMIcons.link),
                      label: Text('Report Bug',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              color: Colors.white70)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onPressed: bugreport,
                    ),
                  ),
                  Container(
                    height: 40,
                  ),
                  Center(
                    child: Text('App Review'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1)),
                  ),

                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Text(
                          'Review',
                          style: TextStyle(fontFamily: 'Montserrat', fontSize: 24),

                        ),



                      )),
                  Container(
                    alignment: Alignment.center,
                    child: OutlineButton.icon(
                      icon: Icon(OMIcons.link),
                      label: Text('App Review',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              color: Colors.white70)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onPressed: appreview,
                    ),
                  ),





                ],
              )),
            ],

          ))
        ],
      ),
    );
  }


  Widget buildCardWidget(Widget child) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: GradientColors.blue,

          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 8),
                color: Colors.black.withAlpha(20),
                blurRadius: 50)
          ]),
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(16),
      child: child,
    );
  }

  Widget buildHeaderWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 16, left: 8),
      child: Text(
        'About App ',
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Colors.lightBlueAccent,)
      ),
    );
  }



  void openGitHub() {
    launch('https://github.com/tiquasar');
  }
  void openflutter() {
    launch('https://flutter.dev/');
  }
  void openandroidstudio() {
    launch('https://developer.android.com/studio');
  }
  void appreview() {
    launch(null);
  }
  void bugreport(){
    launch(null);
  }

}
