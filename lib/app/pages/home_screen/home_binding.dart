import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.put(
          HomePresenter(Get.put(HomeUsecases(Get.find()), permanent: true)),
        ),
      ),
    );
  }
}
