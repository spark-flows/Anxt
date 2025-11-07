import 'dart:async';

import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController(this.splashPresenter);

  final SplashPresenter splashPresenter;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  String? appUrl;

  void startTimer() async {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (Get.find<Repository>()
          .getStringValue(LocalKeys.authToken)
          .isNotEmpty) {
        RouteManagement.goToHomeScreen();
      } else {
        RouteManagement.goToAuthScreen();
      }
    });
    update();
  }
}
