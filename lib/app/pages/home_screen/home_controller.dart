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
  ];

  void onTapItem(String selectItem) {
    switch (selectItem) {
      case "Sales Analytics":
        RouteManagement.goToSalesAnalyticsListScreen();
        break;
      default:
        RouteManagement.goToSalesAnalyticsListScreen();
        break;
    }
  }
}

class HomeModel {
  String? name;
  String? icon;
  String? activeIcon;

  HomeModel({this.name, this.icon, this.activeIcon});
}
