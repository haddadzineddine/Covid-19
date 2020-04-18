import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff121212),
      child: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
