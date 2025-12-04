import 'dart:io';
import 'package:a_nxt/app/pages/document_screen/document_preneter.dart';
import 'package:a_nxt/app/utils/utility.dart';
import 'package:a_nxt/data/helpers/api_wrapper.dart';
import 'package:a_nxt/domain/models/getAll_product_model.dart';
import 'package:a_nxt/domain/models/get_all_category_subcategory.dart';
import 'package:a_nxt/domain/repositories/local_storage_keys.dart';
import 'package:a_nxt/domain/repositories/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class DocumentController extends GetxController {
  DocumentController(this.documentPreneter);

  DocumentPreneter documentPreneter;

  final ScrollController scrollController = ScrollController();
  final ScrollController scrollFolderController = ScrollController();
  TextEditingController tcFolderName = TextEditingController();

  String folderId = '';
  String title = '';
  String branchId = '';
  bool isLongPress = false;
  bool isFolderLongPress = false;

  int pageCount = 1;
  bool isLastPage = false;
  bool isLoading = false;
  // List<ImageDetailsDoc> folderDocList = [];
  bool isClick = true;

  int currentStep = 0;

  // addNewStep(ImageDetailsDoc folderName) {
  //   imageDetailsDocList.add(folderName);
  //   currentStep = imageDetailsDocList.length - 1;
  //   folderId = folderName.id ?? '';
  //   postDetailAllFolders(currentStep);

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (scrollController.hasClients) {
  //       scrollController.animateTo(
  //         scrollController.position.maxScrollExtent,
  //         duration: const Duration(milliseconds: 300),
  //         curve: Curves.easeOut,
  //       );
  //     }
  //   });
  //   update();
  // }

  bool selectAll = false;
  bool selectAllFolder = false;

  void toggleSelectAll() {
    selectAll = !selectAll;

    // for (var item in imageDetailsDocList) {
    //   item.isSelect = selectAll;
    // }
    updateSelectedCount();
    update();
  }

  void toggleSelectAllFolders() {
    selectAllFolder = !selectAllFolder;

    // for (var item in folderDocList) {
    //   item.isSelect = selectAllFolder;
    // }
    updateSelectedDocumentCount();
    update();
  }

  RxInt selectedCount = 0.obs;
  RxInt selectedDocumentCount = 0.obs;

  void updateSelectedCount() {
    // selectedCount.value = imageDetailsDocList.where((e) => e.isSelect).length;
    update();
  }

  void updateSelectedDocumentCount() {
    // selectedDocumentCount.value = folderDocList.where((e) => e.isSelect).length;
    update();
  }

  // void toggleSelectAll(bool value, List<ImageDetailsDoc> list) {
  //   list.where((item) => item.isSelect = value);
  //   update();
  // }

  void goBack() {
    if (currentStep > 0) {
      // imageDetailsDocList.removeLast();
      // currentStep = imageDetailsDocList.length - 1;
      // folderId = imageDetailsDocList[currentStep].id ?? '';
      isLongPress = false;
      // isFolderLoading = true;
      update();
      // postDetailAllFolders(currentStep);
    } else {
      isLongPress = false;
      update();
      Get.back();
    }
  }

  int filePageCount = 1;
  // bool isFolderLoading = false;
  List<ProductListDoc> imageDetailsDocList = [
  ];
  List<GetAllFileDoc> folderDocList = [];

  Future<void> postAllFolders(final String parentid) async {
    var response = await documentPreneter.postAllFolders(
      limit: 10,
      page: filePageCount,
      parentid: folderId,
      search: '',
    );
    folderDocList.clear();
    if (response?.data != null) {
      folderDocList = response!.data.docs;
      update();
    }
  }

  bool isGetProductListLoading = false;

  Future<void> postGetProductList({required categoryId}) async {
    isGetProductListLoading = true;
    var response = await documentPreneter.postGetProductList(
      isLoading: true,
      category: categoryId,
      page: 1,
      limit: 20,
      max: '',
      min: '',
      search: '',
    );
    imageDetailsDocList.clear();
    if (response?.status == 200) {
      imageDetailsDocList = response?.data.docs ?? [];
      isGetProductListLoading = false;
    } else {
      isGetProductListLoading = false;
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  bool downloading = false;

  Future<void> downloadImages() async {
    Get.closeAllSnackbars();
    downloading = true;
    update();
    // late AwesomeNotifications awesomeNotifications = AwesomeNotifications();

    Directory? directory;
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download');
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    final dio = Dio();

    // for (int i = 0; i < imageDetailsDocList.length; i++) {
    //   try {
    //     if (imageDetailsDocList[i].isSelect) {
    //       final fileName = imageDetailsDocList[i].filename;
    //       final filePath =
    //           imageDetailsDocList[i].fileurl?.split('.').last == "mp4"
    //               ? '${directory.path}/$fileName.mp4'
    //               : '${directory.path}/$fileName.png';

    //       await dio.download(
    //         ApiWrapper.imageUrl + (imageDetailsDocList[i].fileurl ?? ""),
    //         filePath,
    //       );
    //     }
    //   } catch (e) {
    //     print('Error downloading image ${i + 1}: $e');
    //   }
    // }
    // imageDetailsDocList.any((element) => element.isSelect = false);
    isLongPress = false;
    downloading = false;
    update();
    // awesomeNotifications.createNotification(
    //   content: NotificationContent(
    //       id: 12,
    //       channelKey: "high_importance_channel",
    //       notificationLayout: NotificationLayout.Default,
    //       title: "Spark Studio",
    //       icon: "",
    //       body: "Media successfully downloaded."),
    // );

    // AwesomeNotifications().setListeners(
    //   onActionReceivedMethod: (receivedAction) async {
    //     // await OpenFile.open(filePath);
    //   },
    //   onNotificationDisplayedMethod: (receivedNotification) async {
    //     if (Platform.isIOS) {
    //       // await OpenFile.open(filePath);
    //     }
    //   },
    // );
  }

  // CreateFolderData? createFolderData;

  // Future<void> postCreateFolder({
  //   required String folderName,
  //   String? parentId,
  // }) async {
  //   var response = await documentPreneter.createFolder(
  //     isLoading: false,
  //     folderId: folderId,
  //     branchId: Get.find<Repository>().getStringValue(LocalKeys.branchid),
  //     parentId: parentId ?? '',
  //     folderName: folderName,
  //   );
  //   createFolderData = null;
  //   if (response?.data != null) {
  //     createFolderData = response?.data;
  //     postAllFolders(1);
  //     isLoading = false;
  //   } else {
  //     isLoading = false;
  //     Utility.errorMessage(response?.message ?? "");
  //   }
  //   update();
  // }

  final pickerResume = ImagePicker();
  File? resumeFile;
  String? resumeStrFile;

  // Future uploadFile() async {
  //   final pickedFile = await pickerResume.pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   if (pickedFile != null) {
  //     resumeFile = File(pickedFile.path);
  //     resumeStrFile = (pickedFile.path);
  //     await postUploadFile();
  //   }
  //   update();
  // }
}
