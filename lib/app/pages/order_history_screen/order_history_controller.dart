import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/models/downlaod_invoice_model.dart';
import 'package:a_nxt/domain/models/getOrderList_model.dart';
import 'package:a_nxt/domain/models/get_one_order_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class OrderHistoryController extends GetxController {
  OrderHistoryController(this.orderHistoryPresenter);

  final OrderHistoryPresenter orderHistoryPresenter;

  DateTime fromInterDate = DateTime.now();
  int filterInterValue = 0;
  List<String> filterInterType = ['Date'];

  TextEditingController searchController = TextEditingController();
  TextEditingController selectDateController = TextEditingController();
  TextEditingController nextDateController = TextEditingController();

  // TextEditingController fromOnboardController = TextEditingController(
  //   text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  // );
  // TextEditingController toOnboardController = TextEditingController(
  //   text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  // );

  List<String> paymentMasterList = [
    'Price Master 01',
    'Price Master 02',
    'Price Master 03',
  ];
  String? paymentMaster;

  bool is18KSelected = false;
  bool is14KSelected = false;

  int calculateTotal(int total) {
    if (is18KSelected) total += 1500;
    if (is14KSelected) total += 1000;
    return total;
  }

  List<GetOrderListDoc> getAllOrderHistoryList = [];
  bool isGetProductListLoading = false;

  PagingController<int, GetOrderListDoc> orderHistoryPagingController =
      PagingController(firstPageKey: 1);

  Future<void> postGetAllTripList(
    int pageKey, {
    required String fromDate,
    required String toDate,
  }) async {
    var response = await orderHistoryPresenter.postOrderHistoryList(
      page: pageKey,
      limit: 40,
      fromDate: fromDate,
      toDate: toDate,
      isLoading: false,
    );
    if (response?.data != null) {
      if (pageKey == 1) {
        getAllOrderHistoryList.clear();
      }
      getAllOrderHistoryList = response?.data?.docs ?? [];

      final isLastPage = getAllOrderHistoryList.length < 10;
      if (isLastPage) {
        orderHistoryPagingController.appendLastPage(getAllOrderHistoryList);
      } else {
        var nextPageKey = pageKey + 1;
        orderHistoryPagingController.appendPage(
          getAllOrderHistoryList,
          nextPageKey,
        );
      }
      update();
    }
  }

  GetOneOrderData? getOneOrderData;
  bool isGetOneOrderData = false;

  Future<void> postOrderDetail({required String orderId}) async {
    isGetOneOrderData = true;
    var response = await orderHistoryPresenter.postOrderDetail(
      isLoading: true,
      orderId: orderId,
    );
    isGetOneOrderData = false;
    getOneOrderData = null;
    if (response?.status == 200) {
      getOneOrderData = response?.data;
    } else {
      isGetOneOrderData = false;
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  DownloadInvoiceData? downloadedInvoiceData;

  Future<void> getInvoiceApi({required String orderNo}) async {
    var response = await orderHistoryPresenter.getInvoiceApi(
      isLoading: false,
      orderNo: orderNo,
    );
    downloadedInvoiceData = null;
    if (response?.data != null) {
      downloadedInvoiceData = response?.data;
      downloadPdf(downloadedInvoiceData?.pdfUrl ?? "");
      Utility.closeLoader();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  Future<void> downloadPdf(String pdfUrl) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final filePath =
          '${dir.path}/invoice_${DateTime.now().millisecondsSinceEpoch}.pdf';

      await Dio().download(pdfUrl, filePath);

      print('PDF downloaded to: $filePath');
      await OpenFilex.open(filePath);
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }
}
