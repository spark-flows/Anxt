import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TripController extends GetxController {
  TripController(this.bottomBarPresenter);

  final TripPresenter bottomBarPresenter;

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
