import 'package:get/get.dart';
import 'package:a_nxt/app/pages/pages.dart';
import 'package:a_nxt/domain/domain.dart';

class OrderHistoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderHistoryController>(
      () => OrderHistoryController(
        Get.put(
          OrderHistoryPresenter(
            Get.put(OrderHistoryUsecases(Get.find()), permanent: true),
            Get.put(CommonUsecases(Get.find()), permanent: true),
          ),
        ),
      ),
    );
  }
}
