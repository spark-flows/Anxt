import 'package:a_nxt/app/pages/profile_screen/profile_page.dart';
import 'package:a_nxt/domain/usecases/profile_usecases.dart';
import 'package:get/get.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        Get.put(
          ProfilePreneter(
            Get.put(ProfileUsecases(Get.find()), permanent: true),
          ),
        ),
      ),
    );
  }
}
