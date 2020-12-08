import 'package:flaiter/hand_gesture_recognition/utils/colors.dart';
import 'package:flaiter/hand_gesture_recognition/utils/sizes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tflite/tflite.dart';

import 'package:flaiter/main.dart';

class ViewfinderPage extends StatefulWidget {
  @override
  _ViewfinderPageState createState() => _ViewfinderPageState();
}

class _ViewfinderPageState extends State<ViewfinderPage> {
  void testModel() async {
    var recoginitions = await Tflite.runModelOnImage(
      path: 'assets/model/testA.png',
      imageMean: 255,
      asynch: true,
    );
    print(recoginitions.toString());
  }

  CameraController _controller;
  Future<void> _initializeControllerFuture;
  bool isCameraReady = false;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras[0];
    _controller = CameraController(firstCamera, ResolutionPreset.ultraHigh);
    _initializeControllerFuture = _controller.initialize().then((_) async {
      if (!mounted) {
        return;
      }
      setState(() {
        isCameraReady = true;
      });

      String res = await Tflite.loadModel(
        model: "assets/model/phone_VGG16_hand_gesture.tflite",
        labels: "assets/model/labels.txt",
      );
      print('start');
      _controller.startImageStream(
        (image) async {
          Tflite.runModelOnFrame(
            bytesList: image.planes.map((plane) {
              return plane.bytes;
            }).toList(),
            imageHeight: image.height,
            imageWidth: image.width,
            threshold: 0.5,
            numResults: 1,
            asynch: true,
          ).then((value) {
            value.map((res) {});
            print(value.first);
            //   print('yes');
            setState(() {
              label = value.first['label'].toString();
            });
            //   print(label);
          });
        },
      );
    });
  }

  String label = '';
  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
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
          backgroundColor: whiteColor,
          body: Stack(
            children: [
              Column(
                children: [
                  Flexible(
                    flex: 5,
                    child: (isCameraReady)
                        ? Hero(
                            tag: 'button',
                            child: CameraPreview(_controller),
                          )
                        : Container(),
                  ),
                  Flexible(
                    flex: 2,
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      duration: Duration(milliseconds: 200),
                      width: displayWidth(context),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Point the Camera towards the Sign Language and get the English Translation',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,

                                    fontWeight: FontWeight.w500,
                                    fontSize: displayWidth(context) * 0.04,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                label,
                                style: TextStyle(
                                  color: mainColor,

                                  fontWeight: FontWeight.w800,
                                  fontSize: displayWidth(context) * 0.14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
