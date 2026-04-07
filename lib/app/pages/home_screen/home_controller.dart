import 'package:a_nxt/app/app.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  HomeController(this.bottomBarPresenter);

  final HomePresenter bottomBarPresenter;

  @override
  onInit() {
    getCurrentLocation();
    super.onInit();
  }

  String selectItem = "";

  List<HomeModel> homeList = [
    HomeModel(
      name: "Sales Analytics",
      icon: AssetConstants.ic_sales_analytics,
      activeIcon: AssetConstants.ic_fill_sales_analytics,
    ),
    HomeModel(
      name: "Catalogue",
      icon: AssetConstants.ic_catlogues,
      activeIcon: AssetConstants.ic_fill_catalogue,
    ),

    HomeModel(
      name: "Stock Catalogue",
      icon: AssetConstants.ic_catlogues,
      activeIcon: AssetConstants.ic_fill_catalogue,
    ),
    HomeModel(
      name: "Order History",
      icon: AssetConstants.ic_order_history,
      activeIcon: AssetConstants.ic_order,
    ),
    HomeModel(
      name: "Trip",
      icon: AssetConstants.ic_trip,
      activeIcon: AssetConstants.ic_fill_trip,
    ),
  ];

  void onTapItem(String selectItem) {
    switch (selectItem) {
      case "Sales Analytics":
        RouteManagement.goToSalesAnalyticsListScreen();
        break;
      case "Catalogue":
        RouteManagement.goToDocumentScreen();
        break;
      case "Stock Catalogue":
        RouteManagement.goToStockCatalogueScreen();
        break;
      case "Order History":
        RouteManagement.goToOrderHistoryScreen();
        break;
      case "Trip":
        RouteManagement.goToTripScreen();
        break;
      default:
        RouteManagement.goToSalesAnalyticsListScreen();
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      if (await Utility.locationPermissionCheack()) {
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
        );

        LatLng currentLatLng = LatLng(position.latitude, position.longitude);

        List<Placemark> placemarks = await placemarkFromCoordinates(
          currentLatLng.latitude,
          currentLatLng.longitude,
        );

        if (placemarks.isNotEmpty) {
          Placemark place = placemarks[0];

          Utility.currentLocation =
              "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";

          Get.forceAppUpdate();
        }
      }
    } catch (e) {
      update();
    } finally {
      Get.forceAppUpdate();
    }
  }
}

class HomeModel {
  String? name;
  String? icon;
  String? activeIcon;

  HomeModel({this.name, this.icon, this.activeIcon});
}
