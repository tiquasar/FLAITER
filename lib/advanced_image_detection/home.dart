import 'package:flaiter/main.dart';
import 'package:flaiter/screens/home.dart';
import 'package:flaiter/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
import 'package:flaiter/screens/home.dart';
import 'camera.dart';
import 'camerabox.dart';
import 'package:flaiter/main.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String res;
    switch (_model) {
      case yolo:
        res = await Tflite.loadModel(
          model: "assets/yolov3.tflite",
          labels: "assets/yolov3.txt",
        );
        break;

      case mobilenet:
        res = await Tflite.loadModel(
            model: "assets/mobilenet_v2.tflite",
            labels: "assets/mobilenet_v2.txt");
        break;

      case posenet:
        res = await Tflite.loadModel(
            model: "assets/posenet_v3.tflite");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet_tensorflow.tflite",
            labels: "assets/ssd_mobilenet_tensorflow.txt");
    }
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {

    Size screen = MediaQuery.of(context).size;
   return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context,CupertinoPageRoute(
                      builder: (context) => FLAITER()));
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
      backgroundColor: Colors.black,

      body: _model == ""
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[

                      TextSpan(
                        text: "\n\nFL",
                        style: GoogleFonts.ubuntu
                          (
                          textStyle:TextStyle(
                            color: Colors.blue.shade200,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),),
                      ),
                      TextSpan(
                        text: "AI",
                        style: GoogleFonts.ubuntu(
                          textStyle:TextStyle(
                            color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            fontSize: 35),),
                      ),

                      TextSpan(
                        text: "TER\n",
                        style: TextStyle(
                            color: Colors.blue.shade200,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),

                    ]),
                  ),
                  Text(
                    'Advanced Object Detection\nand Pose Detection\n',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,

                      fontSize: 26,
                    ),
                  ),
                  Text(
                    "Advanced Object Detection section of the App is in development phase and hence might be slightly unstable.\n",
                      style: TextStyle(color: Colors.orange,fontSize: 18,fontWeight: FontWeight.bold)),



        new SizedBox(
          width: 300.0,
          height: 55.0,
          child: new RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
            ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Object Detection (SSD MobileNet)',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    splashColor: Colors.blue,
                    onPressed: () => onSelect(ssd),
                    color: Colors.green,
                  ),
        ),
                  Text('  ',),
                  new SizedBox(
                    width: 300.0,
                    height: 55.0,
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Object Detection(YOLO v3)',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      splashColor: Colors.blue,
                      onPressed: () => onSelect(yolo),
                      color: Colors.blue,
                    ),
                  ),
                  Text('  ',),
                  new SizedBox(
                    width: 300.0,
                    height: 55.0,
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Pose Estimation(PoseNet)',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      splashColor: Colors.blue,
                      onPressed: () => onSelect(posenet),
                      color: Colors.orange,
                    ),
                  ),
                  Text('  ',),
                  new SizedBox(
                    width: 300.0,
                    height: 55.0,
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Image Classification(MobileNet)',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      splashColor: Colors.blue,
                      onPressed: () => onSelect(mobilenet),
                      color: Colors.tealAccent,
                    ),
                  ),

                ],
              ),
            )
          : Stack(
              children: [
                Camera(
                  widget.cameras,
                  _model,
                  setRecognitions,
                ),
                BndBox(
                    _recognitions == null ? [] : _recognitions,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.height,
                    screen.width,
                    _model),
              ],
            ),
    );
  }
}
