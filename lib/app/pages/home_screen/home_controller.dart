import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
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

  bool isLocationLoading = false;
  String locationError = "";

  Future<bool> handleLocationPermission() async {
    // 1. Check if location service is enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationError = 'Location services are disabled. Please enable GPS.';
      update();
      Get.snackbar(
        'Location Disabled',
        'Please enable location services in your device settings.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      return false;
    }

    // 2. Check permission status
    LocationPermission permission = await Geolocator.checkPermission();

    // 3. Request if denied
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationError = 'Location permission denied.';
        update();
        Get.snackbar(
          'Permission Denied',
          'Location permission is required to use this feature.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }
    }

    // 4. Permanently denied → open app settings
    if (permission == LocationPermission.deniedForever) {
      locationError = 'Location permission permanently denied.';
      update();
      Get.dialog(
        AlertDialog(
          title: const Text('Location Permission Required'),
          content: const Text(
            'Location permission is permanently denied. '
            'Please enable it from app settings.',
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Get.back();
                await Geolocator.openAppSettings(); // Opens iOS/Android settings
              },
              child: const Text('Open Settings'),
            ),
          ],
        ),
      );
      return false;
    }

    return true; // whileInUse or always — both are fine
  }

  Future<void> getCurrentLocation() async {
    try {
      isLocationLoading = true;
      locationError = '';
      update();

      // ✅ Permission check before fetching location
      final hasPermission = await handleLocationPermission();
      if (!hasPermission) return;

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
      // }
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
