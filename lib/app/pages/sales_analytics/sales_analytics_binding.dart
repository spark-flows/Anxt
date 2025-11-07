import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:get/get.dart';

class SalesAnalyticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesAnalyticsController>(
      () => SalesAnalyticsController(
        Get.put(
          SalesAnalyticsPresenter(Get.put(SalesAnalyticsUsecases(Get.find()), permanent: true)),
        ),
      ),
    );
  }
}
