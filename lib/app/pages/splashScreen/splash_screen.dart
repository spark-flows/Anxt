import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (context) {
        return Scaffold(
          backgroundColor: ColorsValue.appColor,
          body: Center(child: Text("ANXT", style: Styles.whiteColorW60016)),
        );
      },
    );
  }
}
