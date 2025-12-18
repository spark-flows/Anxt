import 'package:a_nxt/domain/models/getAll_product_model.dart';
import 'package:a_nxt/domain/models/get_all_category_subcategory.dart';
import 'package:a_nxt/domain/repositories/repository.dart';

class StockCatalogueUsecases {
  StockCatalogueUsecases(this.repository);

  final Repository repository;

  Future<GetAllFileAndFolder?> postAllFolders({
    required int limit,
    required int page,
    required String parentid,
    required String search,
  }) {
    return repository.postAllFolders(
      limit: limit,
      page: page,
      parentid: parentid,
      search: search,
    );
  }

  Future<ProductListModel?> postGetProductList({
    bool isLoading = false,
    required String category,
    required int page,
    required int limit,
    required String max,
    required String min,
    required String search,
  }) async => await repository.postGetProductList(
    isLoading: isLoading,
    category: category,
    page: page,
    limit: limit,
    max: max,
    min: min,
    search: search,
  );
}
