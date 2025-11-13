import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      initState: (state) {
        final controller = Get.find<SplashController>();
        controller.getProfileApi();
      },
      builder: (context) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          body: Center(
            child: Image.asset(AssetConstants.app_icon, width: 230),
            // Text("ANXT", style: Styles.whiteColorW60016)
          ),
        );
      },
    );
  }
}
