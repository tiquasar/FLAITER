import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Loading',
              style: TextStyle(
                  fontSize: 24.0, color: Colors.black54, letterSpacing: 1.0)),
          SizedBox(height: 20.0),
          SpinKitThreeBounce(color: Colors.black54, size: 30.0)
        ]);
  }
}
