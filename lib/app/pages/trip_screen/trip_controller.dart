import 'dart:convert';
import 'dart:io';

import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/models/get_all_expences_category.dart';
import 'package:a_nxt/domain/models/get_one_expences.dart';
import 'package:a_nxt/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

class TripController extends GetxController {
  TripController(this.tripPresenter);

  final TripPresenter tripPresenter;

  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  int filterValue = 0;
  List<String> filterType = ['Date', 'Status'];
  TextEditingController fromCandidateController = TextEditingController();
  TextEditingController toCandidateController = TextEditingController();

  List<FilterModel> statusCandidateList = [
    FilterModel(title: "pending", isSelect: false),
    FilterModel(title: "ongoing", isSelect: false),
    FilterModel(title: "completed", isSelect: false),
    FilterModel(title: "cancelled", isSelect: false),
  ];

  /// ============================================ TripDetailsScreen =======================
  int selectExpense = 0;

  List<String> expenseType = ['All', 'Food', 'Travel', "Accommodation"];

  List<GetAllTripDoc> getAllTripList = [];

  PagingController<int, GetAllTripDoc> tripPagingController = PagingController(
    firstPageKey: 1,
  );

  Future<void> postGetAllTripList(int pageKey) async {
    var response = await tripPresenter.postGetAllTripList(
      page: 1,
      limit: 10,
      location: "",
      search: searchController.text,
      isLoading: false,
    );
    if (response?.data != null) {
      if (pageKey == 1) {
        getAllTripList.clear();
      }
      getAllTripList = response?.data.docs ?? [];

      final isLastPage = getAllTripList.length < 10;
      if (isLastPage) {
        tripPagingController.appendLastPage(getAllTripList);
      } else {
        var nextPageKey = pageKey + 1;
        tripPagingController.appendPage(getAllTripList, nextPageKey);
      }
      update();
    }
  }

  GetOneTripData? getOneTripData;
  bool isGetOneTripDetail = false;

  Future<void> postGetOneTripDetail({required String tripId}) async {
    isGetOneTripDetail = true;
    getOneTripData = null;
    var response = await tripPresenter.postGetOneTripDetail(
      isLoading: true,
      tripId: tripId,
    );
    if (response?.status == 200) {
      getOneTripData = response?.data;
    } else {
      isGetOneTripDetail = false;
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  List<GetAllProductDatum> expanceCategoryList = [];

  Future<void> getExpenseCategory() async {
    var response = await tripPresenter.getExpenseCategory(isLoading: true);
    expanceCategoryList.clear();
    if (response?.status == 200) {
      expanceCategoryList = response?.data.data ?? [];
    } else {
      isGetOneTripDetail = false;
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  GetOneExpenseData? getOneExpenseData;

  Future<void> getOneExpense({required String expenseCatid}) async {
    var response = await tripPresenter.getOneExpense(
      isLoading: true,
      expenseCatid: expenseCatid,
    );
    getOneExpenseData = null;
    if (response?.status == 200) {
      getOneExpenseData = response?.data;
    } else {
      isGetOneTripDetail = false;
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  /// ============================================ AddTripScreen =======================

  GlobalKey<FormState> addTripKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController remarkAddController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  DateTime? startDateTime;
  DateTime? endDateTime;

  String? selectCurrency;
  List<String> currencyList = ["USD", "INR", "EUR", "AED", "KWD"];

  String? selectStatus;

  String? tripid;

  Future<void> postCreateTrip() async {
    var response = await tripPresenter.postCreateTrip(
      tripid: tripid ?? "",
      tripname: nameController.text,
      purpose: purposeController.text,
      status: selectStatus ?? "",
      budget: budgetController.text,
      start:
          startDateController.text.isNotEmpty
              ? DateFormat(
                'yyyy-MM-dd',
              ).format(DateTime.parse(startDateController.text))
              : "",
      end:
          endDateController.text.isNotEmpty
              ? DateFormat(
                'yyyy-MM-dd',
              ).format(DateTime.parse(endDateController.text))
              : "",
      location: locationController.text,
      remark: remarkAddController.text,
      participants: participantsList.map((e) => e.selectMember ?? "").toList(),
      currency: selectCurrency ?? "",
      mediaFileList: [
        ImageFormData(
          fieldName: "image",
          filePath: selectFile?.path ?? "",
          mediaType: MediaType.parse(
            lookupMimeType(selectFile?.path ?? "") ?? "",
          ),
        ),
      ],
      isLoading: true,
    );

    if (response?.statusCode == 200) {
      Get.back();
      tripPagingController.refresh();
      update();
    } else {
      Utility.errorMessage(
        jsonDecode(response?.data?.toString() ?? "")['Message'],
      );
    }
  }

  clearData() {
    selectCurrency = null;
    nameController.clear();
    purposeController.clear();
    budgetController.clear();
    startDateController.clear();
    endDateController.clear();
    locationController.clear();
    remarkAddController.clear();
    currencyController.clear();
    participantsList = [ParticipantsModel(selectMember: null)];
  }

  List<ParticipantsModel> participantsList = [
    ParticipantsModel(selectMember: null),
  ];

  List<UserData> userDataList = [];

  Future<void> getAllUser() async {
    var response = await tripPresenter.getAllUser(isLoading: true);
    userDataList.clear();
    if (response?.data != null) {
      userDataList = response?.data ?? [];
      update();
    }
  }

  final pickerBank = ImagePicker();
  File? selectFile;
  String? selectImage;

  Future uploadInvoice() async {
    final pickedFile = await pickerBank.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectFile = File(pickedFile.path);
      update();
    }
  }

  Future<void> postTripDelete({required String tripId}) async {
    var response = await tripPresenter.postTripDelete(
      isLoading: true,
      tripId: tripId,
    );
    if (response?.statusCode == 200) {
      Get.back();
      tripPagingController.refresh();
    } else {
      Utility.errorMessage(
        jsonDecode(response?.data.toString() ?? "")['Message'],
      );
    }
    update();
  }

  /// ============================================ AddExpenseTripScreen =======================

  GlobalKey<FormState> expenseTripKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  DateTime? dateTime;

  String? selectExpenseCategory;
  String? selectExpenseUser;

  final pickerInvoice = ImagePicker();
  File? selectFileInvoice;
  String? selectInvoice;

  Future uploadinvoice() async {
    final pickedFile = await pickerInvoice.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      selectFileInvoice = File(pickedFile.path);
      update();
    }
  }

  Future<void> postExpenseCreate() async {
    var response = await tripPresenter.postExpenseCreate(
      expenseid: "",
      tripid: tripid ?? "",
      title: titleController.text,
      date:
          dateController.text.isNotEmpty
              ? DateFormat(
                "yyyy-MM-dd",
              ).format(DateTime.parse(dateController.text))
              : "",
      expenseCatid: selectExpenseCategory ?? "",
      userid: selectExpenseUser ?? "",
      amount: amountController.text,
      remark: "",
      mediaFileList: [
        ImageFormData(
          fieldName: "receipt",
          filePath: selectFile?.path ?? "",
          mediaType: MediaType.parse(
            lookupMimeType(selectFile?.path ?? "") ?? "",
          ),
        ),
      ],
      isLoading: true,
    );
    if (response?.statusCode == 200) {
      Get.back();
      postGetOneTripDetail(tripId: tripid ?? "");
      update();
    } else {
      Utility.errorMessage(
        jsonDecode(response?.data?.toString() ?? "")['Message'],
      );
    }
  }
}

class FilterModel {
  String? title;
  bool? isSelect;

  FilterModel({this.title, this.isSelect});
}

class ParticipantsModel {
  String? selectMember;

  ParticipantsModel({this.selectMember});
}
