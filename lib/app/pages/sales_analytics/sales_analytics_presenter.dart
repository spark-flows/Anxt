import 'package:a_nxt/data/helpers/connect_helper.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/getAll_product_model.dart';

class SalesAnalyticsPresenter {
  SalesAnalyticsPresenter(this.salesAnalyticsUsecases);

  final SalesAnalyticsUsecases salesAnalyticsUsecases;

  Future<GetAllUsesList?> postAllUserList({
    bool isLoading = false,
    required int page,
    required int limit,
    required SearchModel search,
    required String fromDate,
    required String toDate,
  }) async => await salesAnalyticsUsecases.postAllUserList(
    isLoading: isLoading,
    page: page,
    limit: limit,
    search: search,
    fromDate: fromDate,
    toDate: toDate,
  );

  Future<GetOneUser?> postGetOneUser({
    bool isLoading = false,
    required String salesid,
  }) async => await salesAnalyticsUsecases.postGetOneUser(
    isLoading: isLoading,
    salesid: salesid,
  );

  Future<ProductListModel?> postGetProductList({
    bool isLoading = false,
    required String category,
    required int page,
    required int limit,
    required String max,
    required String min,
    required String search,
  }) async => await salesAnalyticsUsecases.postGetProductList(
    isLoading: isLoading,
        category: category,
        page: page,
        limit: limit,
        max: max,
        min: min,
        search: search,
  );
}
