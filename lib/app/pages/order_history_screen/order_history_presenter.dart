import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/downlaod_invoice_model.dart';
import 'package:a_nxt/domain/models/getOrderList_model.dart';
import 'package:a_nxt/domain/models/get_one_order_model.dart';

class OrderHistoryPresenter {
  OrderHistoryPresenter(this.orderHistoryUsecases, this.commonUsecases);

  final OrderHistoryUsecases orderHistoryUsecases;
  final CommonUsecases commonUsecases;

  Future<GetOrderListModel?> postOrderHistoryList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String toDate,
    required String fromDate,
  }) async => await orderHistoryUsecases.postOrderHistoryList(
    isLoading: isLoading,
    page: page,
    limit: limit,
    toDate: toDate,
    fromDate: fromDate,
  );

  Future<DownloadInvoiceModel?> getInvoiceApi({
    bool isLoading = false,
    required String jobNo,
    required String pricemasternameid,
  }) async => await orderHistoryUsecases.getInvoiceApi(
    isLoading: isLoading,
    jobNo: jobNo,
    pricemasternameid: pricemasternameid,
  );

  Future<GetOneOrderModel?> postOrderDetail({
    bool isLoading = false,
    required String orderId,
  }) async => await orderHistoryUsecases.postOrderDetail(
    isLoading: isLoading,
    orderId: orderId,
  );
}
