import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/get_stock_product_model.dart';
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
  static void goToTripScreen() => Get.toNamed<void>(Routes.tripscreen);
  static void goToTripDetailsScreen({required String tripid}) =>
      Get.toNamed<void>(Routes.tripDetailsScreen, arguments: tripid);
  static void goToAddExpenseTripScreen() =>
      Get.toNamed<void>(Routes.addExpenseTripScreen);
  static void goToAddTripScreen() => Get.toNamed<void>(Routes.addTripScreen);

  static void goToOrderHistoryDetailsScreen() =>
      Get.toNamed<void>(Routes.orderHistoryDetailsScreen);
  static void goToShowFullScareenImage(String? image, String? type) =>
      Get.toNamed<void>(Routes.showFullScareenImage, arguments: [image, type]);
  static void goToOrderHistoryScreen() =>
      Get.toNamed<void>(Routes.orderHistoryScreen);
  static void goToDocumentScreen() => Get.toNamed<void>(Routes.documentScreen);

  static void goToDocumentDetailScreen(String id) =>
      Get.toNamed<void>(Routes.documentDetailScreen, arguments: id);

  static void goToStockCatalogueScreen() =>
      Get.toNamed<void>(Routes.stockCatalogueScreen);

  static void goToStockCatalogueDetailScreen(String id) =>
      Get.toNamed<void>(Routes.stockCatalogueDetailScreen, arguments: id);

  static void goToFindProductScreen() =>
      Get.toNamed<void>(Routes.findProductSRJOScreen);

  static void goToScannerScreen() => Get.toNamed<void>(Routes.scannerScreen);

  static void goToProductDetailScreen({
    required GetStockProductDatum productDetail,
  }) => Get.toNamed<void>(Routes.productDetailScreen, arguments: productDetail);

  static void goToOrderDetailScreen({required String srjNum}) =>
      Get.toNamed<void>(Routes.orderDetailScreen, arguments: srjNum);

  static void goToCartScreen() => Get.toNamed<void>(Routes.cartScreen);
}
