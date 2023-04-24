import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: Colors.white,
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          child: const CircularProgressIndicator(
            backgroundColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
