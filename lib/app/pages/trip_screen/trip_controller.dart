import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/models/get_all_expences_category.dart';
import 'package:a_nxt/domain/models/get_one_expences.dart';
import 'package:a_nxt/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
    FilterModel(title: "applied", isSelect: false),
    FilterModel(title: "rejected", isSelect: false),
    FilterModel(title: "interview", isSelect: false),
    FilterModel(title: "shortlisted", isSelect: false),
  ];

  /// ============================================ TripDetailsScreen =======================
  int selectExpense = 0;

  List<String> expenseType = ['All', 'Food', 'Travel', "Accommodation"];

  /// ============================================ AddTripScreen =======================

  GlobalKey<FormState> addTripKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController remarkAddController = TextEditingController();

  DateTime? startDateTime;
  DateTime? endDateTime;

  String? selectStatus;

  List<ParticipantsModel> participantsList = [
    ParticipantsModel(selectMember: null),
  ];

  /// ============================================ AddExpenseTripScreen =======================

  GlobalKey<FormState> expenseTripKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  DateTime? dateTime;

  String? selectExpenseCategory;

  String? selectInvoice;

  final pickerBank = ImagePicker();

  Future uploadInvoice() async {
    final pickedFile = await pickerBank.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // var imageData = await eimPresenter.postEimUpload(
      //   employeename: getOneEimData?.personaldetail?.employeeid?.name ?? "",
      //   mediaFileList: [
      //     ImageFormData(
      //       fieldName: "image",
      //       filePath: pickedFile.path,
      //       mediaType: MediaType.parse(lookupMimeType(pickedFile.path) ?? ""),
      //     ),
      //   ],
      //   isLoading: true,
      // );
      update();
    }
  }

  List<GetAllTripDoc> getAllTripList = [];
  int pageCount = 1;
  bool isLastPage = false;
  bool isLoading = false;
  final ScrollController scrollController = ScrollController();

  Future<void> postGetAllTripList(
    int pageKey, {
    String? location,
    String? search,
  }) async {
    if (pageKey == 1) {
      pageCount = 1;
    }
    isLoading = true;
    var response = await tripPresenter.postGetAllTripList(
      page: 1,
      limit: 50,
      location: location ?? "",
      search: search ?? "",
      isLoading: true,
    );
    getAllTripList.clear();
    if (response?.data != null) {
      isLoading = false;
      if (pageKey == 1) {
        isLastPage = false;
        getAllTripList.clear();
      }
      if ((response?.data.docs.length ?? 0) < 20) {
        isLastPage = true;
        getAllTripList.addAll(response?.data.docs ?? []);
      } else {
        pageCount++;
        getAllTripList.addAll(response?.data.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollController.positions.isNotEmpty) {
          scrollController.jumpTo(0);
        }
      }
    } else {
      isLoading = false;
      Utility.errorMessage(
        response?.message ?? 'Getting error while fetching data',
      );
    }
    update();
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

  Future<void> submitTrip(String tripId) async {
    // if (pickedImage.value == null) {
    //   Get.snackbar("Error", "Please select an image");
    //   return;
    // }

    final formData = {
      "tripid": tripId,
      "tripname": nameController.text,
      "purpose": purposeController.text,
      "status": selectStatus ?? '',
      "budget": budgetController.text,
      "start": startDateController.text,
      "end": endDateController.text,
      "location": locationController.text,
      "remark": remarkAddController.text,
      "participants":
          participantsList
              .map((participant) => participant.selectMember ?? '')
              .toList(),
    };

    // final mediaFiles = [
    //   ImageFormData(fieldName: "image", filePath: pickedImage.value!.path),
    // ];

    final response = await tripPresenter.postCreateTrip(
      isLoading: true,
      formData: formData,
      mediaFiles: [],
    );

    if (response?.status == 200) {
      Get.snackbar("Success", "Trip created successfully");
      Get.back();
    } else {
      Get.snackbar("Error", "Failed: ${response?.data}");
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
