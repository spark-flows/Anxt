import 'package:a_nxt/domain/domain.dart';
import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  static void goToHomeScreen() => Get.offAllNamed<void>(Routes.homeScreen);
  static void goToAuthScreen() => Get.offAllNamed<void>(Routes.authScreen);
  static void goToRegisterScreen() => Get.toNamed<void>(Routes.registerScreen);
  static void goToResetPasswordScreen(ForgotData? forgotData) =>
      Get.toNamed<void>(Routes.resetPasswordScreen, arguments: forgotData);
  static void goToForgotScreen() => Get.toNamed<void>(Routes.forgotScreen);
  static void goToSalesAnalyticsScreen({GetOneUserData? customerDetail}) =>
      Get.toNamed<void>(Routes.salesAnalyticsScreen, arguments: customerDetail);
  static void goToSalesAnalyticsDetailsScreen({required String salesid}) =>
      Get.toNamed<void>(Routes.salesAnalyticsDetailsScreen, arguments: salesid);
  static void goToSalesAnalyticsListScreen() =>
      Get.toNamed<void>(Routes.salesAnalyticsListScreen);
  static void goToSalesAnalyticsProductScreen() =>
      Get.toNamed<void>(Routes.salesAnalyticsProductScreen);
  static void goToProfileScreen() => Get.toNamed<void>(Routes.profileScreen);
}
