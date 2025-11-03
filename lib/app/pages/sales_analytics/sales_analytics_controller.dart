import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/data/data.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesAnalyticsController extends GetxController {
  SalesAnalyticsController(this.salesAnalyticsPresenter);

  final SalesAnalyticsPresenter salesAnalyticsPresenter;

  int filterOnboardValue = 0;
  List<String> filterOnboardType = ['Date'];

  TextEditingController fromOnboardController = TextEditingController();
  TextEditingController toOnboardController = TextEditingController();

  DateTime fromOnboardDate = DateTime.now();
  DateTime toOnboardDate = DateTime.now();

  String? selectProduct;
  DateTime? nextDate;
  TextEditingController nextDateController = TextEditingController();

  GlobalKey<FormState> salesKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  int pageCount = 1;
  bool isLastPage = false;
  bool isLoading = false;
  List<GetAllUsesDoc> getAllUserList = [];
  final ScrollController scrollController = ScrollController();

  Future<void> postAllUserList(int pageKey) async {
    if (pageKey == 1) {
      pageCount = 1;
    }
    isLoading = true;
    var response = await salesAnalyticsPresenter.postAllUserList(
      page: pageKey,
      limit: 20,
      search: SearchModel(),
      fromDate: '',
      toDate: '',
      isLoading: false,
    );
    getAllUserList.clear();
    if (response?.data != null) {
      isLoading = false;
      if (pageKey == 1) {
        isLastPage = false;
        getAllUserList.clear();
      }
      if ((response?.data?.docs?.length ?? 0) < 20) {
        isLastPage = true;
        getAllUserList.addAll(response?.data?.docs ?? []);
      } else {
        pageCount++;
        getAllUserList.addAll(response?.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollController.positions.isNotEmpty) {
          scrollController.jumpTo(0);
        }
      }
    } else {
      isLoading = false;
      Utility.errorMessage(response?.message ?? 'show Error like Check Error');
    }
    update();
  }

  GetOneUserData? getOneUser;
  bool isGetOneUserLoading = false;

  Future<void> postGetOneUser({required String salesid}) async {
    isGetOneUserLoading = true;
    var response = await salesAnalyticsPresenter.postGetOneUser(
      isLoading: true,
      salesid: salesid,
    );
    getOneUser = null;
    if (response?.status == 200) {
      getOneUser = response?.data;
      isGetOneUserLoading = false;
    } else {
      isGetOneUserLoading = false;
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }
}
