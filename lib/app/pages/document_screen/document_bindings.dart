import 'package:a_nxt/app/pages/document_screen/document_controller.dart';
import 'package:a_nxt/app/pages/document_screen/document_preneter.dart';
import 'package:a_nxt/domain/usecases/document_usecases.dart';
import 'package:get/get.dart';

class DocumentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentController>(
      () => DocumentController(
        Get.put(
          DocumentPreneter(
            Get.put(DocumentUsecases(Get.find()), permanent: true),
          ),
        ),
      ),
    );
  }
}