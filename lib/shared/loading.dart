import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.red,
          size: 50.0,
        ),
      ),
    );
  }
}