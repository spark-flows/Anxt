import 'dart:async';

import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController(this.splashPresenter);

  final SplashPresenter splashPresenter;

  Future<void> getProfileApi() async {
    var response = await splashPresenter.getProfileApi(isLoading: false);
    Utility.profileData = null;
    if (response?.data != null) {
      Utility.profileData = response!.data;
      Get.find<Repository>().saveSecureValue(LocalKeys.salesPersonId, response.data?.userData?.id ?? "");
      update();
    }
  }

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
