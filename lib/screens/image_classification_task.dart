import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageTaskScreen extends StatelessWidget {
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
                title: Text('Image Classification'),
                centerTitle: true),
            body: Padding(
                padding: EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Material(
                          color: Color(0xFF4299E1).withOpacity(.2),
                          child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, '/image-animals'),
                              child: SizedBox(
                                  height: 120.0,
                                  child: Row(children: <Widget>[
                                    SizedBox(width: 10.0),
                                    Container(
                                        height: 50.0,
                                        child: SvgPicture.asset(
                                            'assets/icons/animals.svg',
                                            color: Color(0xFF4299E1))),
                                    SizedBox(width: 10.0),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Animals',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10.0),
                                          Text('2 labels',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54))
                                        ])
                                  ]))))),
                ])))));
  }
}
