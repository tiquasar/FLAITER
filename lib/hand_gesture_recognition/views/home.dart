import 'package:flaiter/hand_gesture_recognition/utils/colors.dart';
import 'package:flaiter/hand_gesture_recognition/utils/sizes.dart';
import 'package:flaiter/hand_gesture_recognition/views/viewfinder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tflite/tflite.dart';

import 'package:flaiter/main.dart';

class HomeScreenh extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

String res;
//not using this.
void loadModel() async {
  res = await Tflite.loadModel(
    model: "assets/model/phone_VGG16_hand_gesture.tflite",
    labels: "assets/model/labels.txt",
  );
}
//ignore

class _HomeScreenState extends State<HomeScreenh> {
  void testModel() async {
    var recoginitions = await Tflite.runModelOnImage(
      path: 'assets/model/testA.png',
      imageMean: 255,
      asynch: true,
    );
    print(recoginitions.toString());
  }

  @override
  void initState() {
    //loadModel();
    super.initState();
  }

  bool panelOpen = false;

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: secondaryColor,
        systemNavigationBarColor: Colors.black,
      ),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context,CupertinoPageRoute(
                      builder: (context) => FLAITER()));
                },
                icon: Icon(OMIcons.arrowBackIos,
                    color: Colors.white)),
            title: Text('Hand Gesture Recognition',
              style: TextStyle(color:Colors.white.withOpacity(0.8)),),
            centerTitle: true),
        backgroundColor: secondaryColor,
        body: SafeArea(
          child: SlidingUpPanel(

            onPanelOpened: () {
              setState(() {
                panelOpen = true;
              });
            },
            onPanelClosed: () {
              setState(() {
                panelOpen = false;
              });
            },
            minHeight: displayHeight(context) * 0.53,
            maxHeight: displayHeight(context) * 0.95,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            panel: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: displayWidth(context) * 0.12,
                          height: 3,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Learn Hand Gestures\n',
                          style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.w300,

                            fontSize: displayWidth(context) * 0.08,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(

                      child: ListView(
                        shrinkWrap: true,
                        physics: (panelOpen)
                            ? BouncingScrollPhysics()
                            : NeverScrollableScrollPhysics(),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(

                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/A.png',
                                          width: displayWidth(context) * 0.2,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'A',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/B.png',
                                          width: displayWidth(context) * 0.116,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'B',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/C.png',
                                          width: displayWidth(context) * 0.2,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'C',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/D.png',
                                          width: displayWidth(context) * 0.12,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'D',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/E.png',
                                          width: displayWidth(context) * 0.13,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'E',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/F.png',
                                          width: displayWidth(context) * 0.128,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'F',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/G.png',
                                          width: displayWidth(context) * 0.25,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'G',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/H.png',
                                          width: displayWidth(context) * 0.25,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'H',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/I.png',
                                          width: displayWidth(context) * 0.128,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'I',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/J.png',
                                          width: displayWidth(context) * 0.2,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'J',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/K.png',
                                          width: displayWidth(context) * 0.12,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'K',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/L.png',
                                          width: displayWidth(context) * 0.15,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'L',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/M.png',
                                          width: displayWidth(context) * 0.19,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'M',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/N.png',
                                          width: displayWidth(context) * 0.19,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'N',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/O.png',
                                          width: displayWidth(context) * 0.16,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'O',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/P.png',
                                          width: displayWidth(context) * 0.25,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'P',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/Q.png',
                                          width: displayWidth(context) * 0.19,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Q',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/R.png',
                                          width: displayWidth(context) * 0.1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'R',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/S.png',
                                          width: displayWidth(context) * 0.19,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'S',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/T.png',
                                          width: displayWidth(context) * 0.19,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'T',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/U.png',
                                          width: displayWidth(context) * 0.13,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'U',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/V.png',
                                          width: displayWidth(context) * 0.15,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'V',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/W.png',
                                          width: displayWidth(context) * 0.15,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'W',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/X.png',
                                          width: displayWidth(context) * 0.14,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'X',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/Y.png',
                                          width: displayWidth(context) * 0.2,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Y',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: displayWidth(context) * 0.4,
                                width: displayWidth(context) * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/signs/Z.png',
                                          width: displayWidth(context) * 0.13,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Z',
                                          style: TextStyle(

                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                displayWidth(context) * 0.12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [

                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: <TextSpan>[

                          TextSpan(
                            text: "FLAITER\n\n",
                            style: TextStyle(


                              fontWeight: FontWeight.w600,
                              color: Colors.lightBlueAccent.shade400,
                              fontSize: displayWidth(context) * 0.10,),
                          ),
                          TextSpan(
                            text: "Hand Sign Language Recognition",
                            style: TextStyle(

                              fontWeight: FontWeight.w600,
                              color: Colors.lightBlueAccent.shade400,
                              fontSize: displayWidth(context) * 0.040,),
                          ),


                        ]),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Hero(
                        tag: 'button',
                        child: Container(

                          width: displayWidth(context) * 0.7,
                          height: displayWidth(context) * 0.14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 10),
                                spreadRadius: -5,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: RaisedButton(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Live Hand Gesture Translation',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: displayWidth(context) * 0.045,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              splashColor: mainColor,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  SlideRightRoute(page: ViewfinderPage()),
                                );
                              },
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

/*
SafeArea(
          child: Stack(
            children: [
              Container(
                color: whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'A2E',
                            style: TextStyle(

                              fontWeight: FontWeight.w600,
                              fontSize: displayWidth(context) * 0.1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: displayWidth(context) * 0.5,
                            child: Text(
                              'Communication should have no boundaries',
                              style: TextStyle(

                                fontWeight: FontWeight.w800,
                                fontSize: displayWidth(context) * 0.04,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.transparent,
                  height: displayWidth(context) * 1.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(90),
                            ),
                          ),
                          height: 800,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),*/
