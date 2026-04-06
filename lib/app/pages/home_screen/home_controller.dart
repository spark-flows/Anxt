import 'package:a_nxt/app/app.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.bottomBarPresenter);

  final HomePresenter bottomBarPresenter;

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
}

class HomeModel {
  String? name;
  String? icon;
  String? activeIcon;

  HomeModel({this.name, this.icon, this.activeIcon});
}
