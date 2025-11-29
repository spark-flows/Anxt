import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:get/get.dart';

class TripBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripController>(
      () => TripController(
        Get.put(
          TripPresenter(Get.put(TripUsecases(Get.find()), permanent: true)),
        ),
      ),
    );
  }
}
