import 'package:a_nxt/domain/models/downlaod_invoice_model.dart';
import 'package:a_nxt/domain/models/getOrderList_model.dart';
import 'package:a_nxt/domain/models/get_one_order_model.dart';
import 'package:a_nxt/domain/repositories/repository.dart';

class OrderHistoryUsecases {
  OrderHistoryUsecases(this.repository);

  final Repository repository;

  Future<GetOrderListModel?> postOrderHistoryList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String toDate,
    required String fromDate,
  }) async => await repository.postOrderHistoryList(
    isLoading: isLoading,
    page: page,
    limit: limit,
    toDate: toDate,
    fromDate: fromDate,
  );

  Future<DownloadInvoiceModel?> getInvoiceApi({
    bool isLoading = false,
    required String orderNo,
  }) async =>
      await repository.getInvoiceApi(isLoading: isLoading, orderNo: orderNo);

  Future<GetOneOrderModel?> postOrderDetail({
    bool isLoading = false,
    required String orderId,
  }) async =>
      await repository.postOrderDetail(isLoading: isLoading, orderId: orderId);
}
