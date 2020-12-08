import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flaiter/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final picker = ImagePicker();
  File _image;
  bool _loading = false;
  List _output;

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      // setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,   // required
        imageMean: 0.0,   // defaults to 117.0
        imageStd: 255.0,  // defaults to 1.0
        numResults: 2,    // defaults to 5
        threshold: 0.2,   // defaults to 0.1
        asynch: true      // defaults to true
    );

    setState(() {
      _loading = false;
      _output = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,CupertinoPageRoute(
                    builder: (context) => FLAITER()));
              },
              icon: Icon(OMIcons.arrowBackIos,
                  color: Colors.white)),
          title: Text('Object Detection ( FLAITER )',
          style: TextStyle(color:Colors.white.withOpacity(0.8)),),
          centerTitle: true),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.004, 1],
            colors: GradientColors.royalBlue,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[

                  TextSpan(
                      text: "Looking for your spectacles? 👀\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 15),
                  ),
                  TextSpan(
                      text: "Well ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 15),
                  ),

                  TextSpan(
                      text: "FLAITER",
                    style: TextStyle(
                        color: Colors.blue.shade100,
                        fontWeight: FontWeight.w300,
                        fontSize: 15),
                  ),
                  TextSpan(
                      text: " can\'t find it, but sure can classify it.",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 15),
                  ),
                ]),
              ),


              SizedBox(
                height: 18,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 320,
                      child: Center(
                        child: _loading
                            ? Container(
                                width: 180,
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/flower.png'),
                                    SizedBox(
                                      height: 60,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.circular(5),
                                      //   boxShadow: [
                                      //     BoxShadow(
                                      //       color:
                                      //           Colors.black.withOpacity(0.5),
                                      //       spreadRadius: 5,
                                      //       blurRadius: 7,
                                      //     ),
                                      //   ],
                                      // ),
                                      height: 200,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          _image,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    _output != null ?
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: <TextSpan>[

                                        TextSpan(
                                          text: "Prediction by CNN is:\n",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,fontWeight: FontWeight.w300),
                                        ),
                                        TextSpan(
                                          text: "${_output[0]['label'].toString().toUpperCase()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0),
                                        ),
                                      ]),
                                    ): Container(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: pickImage,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 180,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 17,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade400,
                                  borderRadius: BorderRadius.circular(9),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                    )
                                  ],

                                ),
                                child: Text(
                                  'Take a photo',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: pickGalleryImage,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 180,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 17,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade400,
                                  borderRadius: BorderRadius.circular(9),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                    )
                                  ],
                                ),
                                child: Text(
                                  'Camera Roll',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
