import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'package:flaiter/widgets/loading_indicator.dart';

class ImageAnimalsScreen extends StatefulWidget {
  @override
  _ImageAnimalsScreenState createState() => _ImageAnimalsScreenState();
}

class _ImageAnimalsScreenState extends State<ImageAnimalsScreen> {
  bool _isImageInProcess = false;
  File _image;
  var _result;
  String _path;

  Future getImage(ImageSource source) async {
    setState(() => _isImageInProcess = true);

    File image = await ImagePicker.pickImage(source: source);

    if (image != null) {
      File croppedImage = await ImageCropper.cropImage(
          sourcePath: image.path,
          compressQuality: 100,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Color(0xFF4299E1),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(title: 'Crop Image'));

      if (croppedImage != null) {
        setState(() {
          _image = croppedImage;
          _path = croppedImage.path;
          classifyImage();
        });
      } else {
        setState(() => _isImageInProcess = false);
      }
    } else {
      setState(() => _isImageInProcess = false);
    }
  }

  Future loadModel() async {
    Tflite.close();
    try {
      String res;
      res = await Tflite.loadModel(
          model: "assets/ml_models/image/animals.tflite",
          labels: "assets/ml_models/image/animals_labels.txt");
      print(res);
    } on PlatformException {
      print('Failed to load Animal model.');
    }
  }

  Future classifyImage() async {
    var output = await Tflite.runModelOnImage(
        path: _path,
        numResults: 6,
        threshold: 0.05,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _result = output[0]["label"];
      print(_result);
      _isImageInProcess = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (Navigator.of(context).userGestureInProgress) return false;
          return true;
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                leading: IconButton(
                    icon: SvgPicture.asset('assets/icons/arrow-left.svg',
                        color: Colors.white),
                    onPressed: () => Navigator.of(context).pop()),
                title: Text('Animals'),
                centerTitle: true),
            body: _isImageInProcess
                ? LoadingIndicator()
                : Padding(
                    padding:
                        EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
                    child: SingleChildScrollView(
                        child: Center(
                            child: Column(children: <Widget>[
                      SizedBox(height: 30.0),
                      GestureDetector(
                          onTap: () => selectImageDialog(context),
                          child: Container(
                              height: 200.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: _image != null
                                      ? Colors.transparent
                                      : Color(0xFFFDFDFD),
                                  boxShadow: _image == null
                                      ? [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 10.0)
                                        ]
                                      : null),
                              child: _image == null
                                  ? Icon(Icons.add_photo_alternate, size: 32.0)
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.file(_image)))),
                      SizedBox(height: 50.0),
                      _result != null
                          ? Column(children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Prediction - ',
                                        style: TextStyle(fontSize: 20.0)),
                                    Text(_result,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xFF4299E1)))
                                  ])
                            ])
                          : Text('Tap above box to select an image !',
                              style: TextStyle(fontSize: 18.0))
                    ]))))));
  }

  Future selectImageDialog(context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  height: 240.0,
                  width: 200.0,
                  padding: EdgeInsets.all(30.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                            child: Text('Choose from',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(height: 15.0),
                        Divider(color: Colors.grey),
                        SizedBox(height: 15.0),
                        InkWell(
                            onTap: () {
                              getImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                height: 40.0,
                                child: Row(children: <Widget>[
                                  Icon(Icons.camera, color: Color(0xFF4299E1)),
                                  SizedBox(width: 20.0),
                                  Text('Camera',
                                      style: TextStyle(fontSize: 20.0))
                                ]))),
                        SizedBox(height: 30.0),
                        InkWell(
                            onTap: () {
                              getImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                height: 40.0,
                                child: Row(children: <Widget>[
                                  Icon(Icons.photo_library,
                                      color: Color(0xFF30E3CA)),
                                  SizedBox(width: 20.0),
                                  Text('Gallery',
                                      style: TextStyle(fontSize: 20.0))
                                ])))
                      ])));
        });
  }
}
