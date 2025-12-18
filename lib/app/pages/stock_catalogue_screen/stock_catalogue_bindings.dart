import 'package:a_nxt/app/pages/stock_catalogue_screen/stock_catalogue_controller.dart';
import 'package:a_nxt/app/pages/stock_catalogue_screen/stock_catalogue_preneter.dart';
import 'package:a_nxt/domain/usecases/stock_catalogue_usecases.dart';
import 'package:get/get.dart';

class StockCatalogueBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockCatalogueController>(
      () => StockCatalogueController(
        Get.put(
          StockCataloguePreneter(
            Get.put(StockCatalogueUsecases(Get.find()), permanent: true),
          ),
        ),
      ),
    );
  }
}
