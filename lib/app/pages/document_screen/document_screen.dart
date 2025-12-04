import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/app/pages/document_screen/document_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentController>(
      initState: (state) {
        var controller = Get.find<DocumentController>();
        controller.postAllFolders('');
        // controller.postAllFolders(1);
        // controller.scrollController.addListener(() async {
        //   if (controller.scrollController.position.pixels ==
        //       controller.scrollController.position.maxScrollExtent) {
        //     if (controller.isLoading == false) {
        //       controller.isLoading = true;
        //       controller.update();
        //       if (controller.isLastPage == false) {
        //         await controller.postAllFolders(controller.pageCount);
        //       }
        //       controller.isLoading = false;
        //       controller.update();
        //     }
        //   }
        // });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: controller.goBack,
            title: 'Document',
            isVisible: true,
            isCenter: true,
          ),
          body:
              // !controller.isFolderLoading
                  // ? 
                  controller.folderDocList.isNotEmpty
                      ? Padding(
                        padding: Dimens.edgeInsets20_10_20_10.copyWith(
                          top: 0,
                          bottom: 0,
                        ),
                        child: Column(
                          children: [
                            if (controller.isFolderLongPress) ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      // final selectedDeleteFolder = controller
                                      //     .getSelectedFolderIds(
                                      //       controller.folderDocList,
                                      //     );
                                      // showDeleteDialog(
                                      //   context,
                                      //   controller: controller,
                                      //   selectedDeleteFolder:
                                      //       selectedDeleteFolder,
                                      // );
                                    },
                                    child: Container(
                                      margin: Dimens.edgeInsets10.copyWith(
                                        left: 0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorsValue.colorFFEDED,
                                        borderRadius: BorderRadius.circular(
                                          Dimens.four,
                                        ),
                                        border: Border.all(
                                          color: ColorsValue.redColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: Dimens.edgeInsets0.copyWith(
                                          top: 4,
                                          left: 22,
                                          right: 22,
                                          bottom: 4,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Delete",
                                              style: Styles.black50018.copyWith(
                                                color: ColorsValue.redColor,
                                              ),
                                            ),
                                            Dimens.boxWidth10,
                                            SvgPicture.asset(
                                              AssetConstants.ic_delete,
                                              colorFilter: ColorFilter.mode(
                                                ColorsValue.redColor,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: controller.selectAllFolder,
                                        onChanged: (value) {
                                          controller.toggleSelectAllFolders();
                                        },
                                      ),
                                      Text("Select All"),
                                    ],
                                  ),
                                  Obx(
                                    () => Text(
                                      "Selected ${controller.selectedDocumentCount.value} File",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            Expanded(
                              child: GridView.builder(
                                // padding: Dimens.edgeInsets20,
                                controller: controller.scrollController,
                                itemCount: 10,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: Dimens.eight,
                                      mainAxisSpacing: Dimens.eight,
                                    ),
                                itemBuilder: (context, index) {
                                  final element =
                                      controller.folderDocList[index];
                                  return Stack(
                                    children: [
                                      // InkWell(
                                      //   onTap: () async {
                                      //     // await showAddDialog(
                                      //     //   context,
                                      //     //   isEdit: true,
                                      //     //   element.foldername,
                                      //     //   controller,
                                      //     //   onSave: (folderName) {
                                      //     //     controller.postCreateFolder(
                                      //     //       folderName:
                                      //     //           controller
                                      //     //               .tcFolderName
                                      //     //               .text,
                                      //     //       parentId: element.parentid,
                                      //     //     );
                                      //     //   },
                                      //     // );

                                      //     // print(controller.isEdit);
                                      //     controller.update();
                                      //   },
                                      //   child: Align(
                                      //     alignment: Alignment.topLeft,
                                      //     child: Container(
                                      //       margin: Dimens.edgeInsets10,
                                      //       decoration: BoxDecoration(
                                      //         color: ColorsValue.lightCBD5E1,
                                      //         borderRadius:
                                      //             BorderRadius.circular(
                                      //               Dimens.four,
                                      //             ),
                                      //         border: Border.all(
                                      //           color: ColorsValue.lightCBD5E1,
                                      //         ),
                                      //       ),
                                      //       child: Padding(
                                      //         padding: Dimens.edgeInsets0
                                      //             .copyWith(
                                      //               top: 4,
                                      //               left: 8,
                                      //               right: 8,
                                      //               bottom: 4,
                                      //             ),
                                      //         child: Row(
                                      //           mainAxisSize: MainAxisSize.min,
                                      //           children: [
                                      //             SvgPicture.asset(
                                      //               AssetConstants.edit_Doc,
                                      //               colorFilter:
                                      //                   ColorFilter.mode(
                                      //                     ColorsValue
                                      //                         .txtBlackColor,
                                      //                     BlendMode.srcIn,
                                      //                   ),
                                      //             ),
                                      //             Dimens.boxWidth5,
                                      //             Text(
                                      //               "Edit",
                                      //               style: Styles.black50018
                                      //                   .copyWith(
                                      //                     fontSize: 16,
                                      //                     color:
                                      //                         ColorsValue
                                      //                             .txtBlackColor,
                                      //                   ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      GestureDetector(
                                        onLongPress: () {
                                          // if (controller.isFolderLongPress) {
                                          //   controller
                                          //       .folderDocList[index]
                                          //       .isSelect = true;
                                          //   controller.isFolderLongPress =
                                          //       false;
                                          // } else {
                                          //   controller
                                          //       .folderDocList[index]
                                          //       .isSelect = true;
                                          //   controller.isFolderLongPress = true;
                                          // }
                                          controller.update();
                                        },
                                        onTap: () {
                                          if (!controller.isFolderLongPress) {
                                            RouteManagement.goToDocumentDetailScreen(
                                              // controller
                                              //         .folderDocList[index]
                                              //         .id ??
                                              //     "",
                                              // controller
                                              //         .folderDocList[index]
                                              //         .foldername ??
                                              //     "",
                                              element.id,
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: Dimens.edgeInsets5,
                                          decoration: BoxDecoration(
                                            color: ColorsValue.lightCBD5E1
                                                .withOpacity(0.4),
                                            borderRadius: BorderRadius.circular(
                                              Dimens.ten,
                                            ),
                                            border: Border.all(
                                              color: ColorsValue.lightCBD5E1,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                AssetConstants.folder_image,
                                                height: 70,
                                              ),
                                              Dimens.boxHeight10,
                                              Text(element.name,
                                                style: Styles
                                                    .txtBlackColorW60016
                                                    .copyWith(
                                                      fontSize: Dimens.eighteen,
                                                    ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // if (controller.isFolderLongPress) ...[
                                      //   Positioned(
                                      //     right: 0,
                                      //     child: Transform.scale(
                                      //       scale: 1.2,
                                      //       child: Checkbox(
                                      //         value: element.isSelect,
                                      //         activeColor: ColorsValue.appColor,
                                      //         onChanged: (value) {
                                      //           element.isSelect = value!;
                                      //           controller
                                      //               .updateSelectedDocumentCount();
                                      //           controller.update();
                                      //         },
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ],
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                      : Center(
                        child: Text(
                          "Folder data not found...!",
                          style: Styles.black50014,
                        ),
                      ),
                  // : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Future showAddDialog(
  BuildContext context,
  String? folderName,
  DocumentController controller, {
  bool isEdit = false,
  required Function(String folderName) onSave,
}) async {
  controller.tcFolderName.text = folderName ?? "";

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero.copyWith(left: 20, right: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isEdit ? "Edit Folder" : "Create Folder",
                  style: Styles.appColorW60014.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: ColorsValue.color0F172A,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),

            Dimens.boxHeight10,

            CustomTextFormField(
              controller: controller.tcFolderName,
              isTitle: true,
              titleStyle: Styles.txtBlackColorW70014.copyWith(
                fontSize: Utility.isTablet() ? Dimens.twenty : Dimens.sixteen,
              ),
              hintStyle: Styles.txtGreyColorW50012.copyWith(
                fontSize: Utility.isTablet() ? Dimens.eighteen : Dimens.sixteen,
              ),
              hintText: 'Enter Folder Name',
              title: 'Folder Name',
              fillColor: ColorsValue.textFieldBg,
              filled: true,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              validator: (val) {
                if (val!.trim().isEmpty) {
                  return 'Please enter folder name';
                }
                return null;
              },
            ),

            Dimens.boxHeight10,

            CustomButton(
              heightBtn: 50,
              radius: 4,
              backgroundColor: ColorsValue.appColor,
              onPressed: () {
                final name = controller.tcFolderName.text.trim();
                if (name.isEmpty) return;
                onSave(name);
                Get.back();
              },
              textStyle: Styles.whiteColorW80018,
              text: isEdit ? 'Update' : 'Save',
            ),
          ],
        ),
      );
    },
  );
}

Future showDeleteDialog(
  BuildContext context, {
  required List<String> selectedDeleteFolder,
  required DocumentController controller,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero.copyWith(left: 20, right: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are You Sure You Want To Delete Folder?',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Delete",
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      );
    },
  );
}
