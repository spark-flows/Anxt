import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:a_nxt/app/app.dart';

class OrderHistoryController extends GetxController {
  OrderHistoryController(this.homePresenter);

  final OrderHistoryPresenter homePresenter;

  DateTime fromInterDate = DateTime.now();
  int filterInterValue = 0;
  List<String> filterInterType = ['Date'];

  TextEditingController searchController = TextEditingController();
  TextEditingController selectDateController = TextEditingController();
}
