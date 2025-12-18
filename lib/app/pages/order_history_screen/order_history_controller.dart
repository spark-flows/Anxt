import 'package:a_nxt/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  OrderHistoryController(this.homePresenter);

  final OrderHistoryPresenter homePresenter;

  DateTime fromInterDate = DateTime.now();
  int filterInterValue = 0;
  List<String> filterInterType = ['Date'];

  TextEditingController searchController = TextEditingController();
  TextEditingController selectDateController = TextEditingController();
  TextEditingController nextDateController = TextEditingController();

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
}
