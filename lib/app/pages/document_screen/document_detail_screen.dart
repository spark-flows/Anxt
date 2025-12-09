import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/app/pages/document_screen/document_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DocumentDetailScreen extends StatefulWidget {
  const DocumentDetailScreen({super.key});

  @override
  State<DocumentDetailScreen> createState() => _DocumentDetailScreenState();
}

class _DocumentDetailScreenState extends State<DocumentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentController>(
      initState: (state) async {
        var controller = Get.find<DocumentController>();
        controller.selectAll = controller.imageDetailsDocList.every(
          (item) => item.isSelect,
        );
        controller.folderId = Get.arguments;
        controller.postGetProductList(categoryId: Get.arguments);
        // controller.isFolderLoading = true;
        // controller.isClick = true;
        // controller.folderDocList = [
        //   ImageDetailsDoc(
        //     id: controller.folderId,
        //     foldername: controller.title,
        //   ),
        // ];
        // await controller.postDetailAllFolders(1);
        // controller.scrollFolderController.addListener(() async {
        //   if (controller.scrollFolderController.position.pixels ==
        //       controller.scrollFolderController.position.maxScrollExtent) {
        //     if (controller.isLoading == false) {
        //       controller.isLoading = true;
        //       controller.update();
        //       if (controller.isLastPage == false) {
        //         await controller.postDetailAllFolders(controller.pageCount);
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
            title: 'Catlogues Details',
            isVisible: true,
            isCenter: true,
          ),
          body:
              controller.imageDetailsDocList.isNotEmpty
                  ? Padding(
                    padding: Dimens.edgeInsets20_10_20_10.copyWith(
                      top: 0,
                      bottom: 0,
                    ),
                    child: Column(
                      children: [
                        if (controller.isLongPress) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  // showDeleteDialog(
                                  //   context,
                                  //   selectedIndex: selectedIndex,
                                  //   controller: controller,
                                  // );
                                },
                                child: Container(
                                  margin: Dimens.edgeInsets10.copyWith(left: 0),
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
                              GestureDetector(
                                onTap: () {
                                  // final selectedDeleteUrl = controller
                                  //     .getSelectedFolderUrl(
                                  //       controller.imageDetailsDocList,
                                  //     );
                                  // controller.shareProductUrls(
                                  //   selectedDeleteUrl,
                                  // );
                                },
                                child: Container(
                                  margin: Dimens.edgeInsets10.copyWith(left: 0),
                                  decoration: BoxDecoration(
                                    color: ColorsValue.lightCBD5E1.withOpacity(
                                      0.3,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      Dimens.four,
                                    ),
                                    border: Border.all(
                                      color: ColorsValue.lineColor,
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
                                          "Share",
                                          style: Styles.black50018.copyWith(
                                            color: ColorsValue.color1E293B,
                                          ),
                                        ),
                                        Dimens.boxWidth10,
                                        SvgPicture.asset(
                                          AssetConstants.ic_share,
                                          colorFilter: ColorFilter.mode(
                                            ColorsValue.color1E293B,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: controller.selectAll,
                                    onChanged: (value) {
                                      controller.toggleSelectAll();
                                    },
                                  ),
                                  Text("Select All"),
                                ],
                              ),
                              Obx(
                                () => Text(
                                  "Selected ${controller.selectedCount.value} File",
                                ),
                              ),
                            ],
                          ),
                        ],
                        Expanded(
                          child:
                              // !controller.isFolderLoading
                              // ?
                              controller.imageDetailsDocList.isNotEmpty
                                  ? !controller.downloading
                                      ? ListView.builder(
                                        itemCount:
                                            controller
                                                .imageDetailsDocList
                                                .length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          var item =
                                              controller
                                                  .imageDetailsDocList[index];
                                          return ProductCard(
                                            tagno: item.tagno,
                                            designNo: item.designno,
                                            code: item.tagno,
                                            imageUrl: item.image,
                                            gw: item.gwt.toString(),
                                            dw: item.dwt.toString(),
                                            ow: '112',
                                            nw: item.nwt.toString(),
                                            kt: '120',
                                            onTap: () {},
                                          );
                                        },
                                        // GridView.builder(
                                        //   itemCount:
                                        //       controller
                                        //           .imageDetailsDocList
                                        //           .length,
                                        //   shrinkWrap: true,
                                        //   gridDelegate:
                                        //       SliverGridDelegateWithFixedCrossAxisCount(
                                        //         crossAxisCount: 3,
                                        //         crossAxisSpacing: Dimens.eight,
                                        //         mainAxisSpacing: Dimens.eight,
                                        //       ),
                                        //   itemBuilder: (context, index) {
                                        //     var item =
                                        //         controller
                                        //             .imageDetailsDocList[index];
                                        //     final fileType =
                                        //         // Utility.getFileTypeFromUrl(
                                        //         //   item.fileurl ?? "",
                                        //         // );
                                        //         "image" ?? "";

                                        //     return ProductCard(
                                        //       designNo: item.tagno,
                                        //       code: item.tagno,
                                        //       imageUrl: item.image,
                                        //       gw: item.gwt.toString(),
                                        //       dw: item.dwt.toString(),
                                        //       ow: '112',
                                        //       nw: item.nwt.toString(),
                                        //       kt: '120',
                                        //       onTap: () {},
                                        //     );

                                        //     return GestureDetector(
                                        //       onLongPress: () {
                                        //         // if (fileType != "folder") {
                                        //         //   item.isSelect =
                                        //         //       !item.isSelect;
                                        //         //   controller.isLongPress =
                                        //         //       true;
                                        //         //   controller.update();
                                        //         // }
                                        //       },
                                        //       onTap: () {
                                        //         // if (fileType == "image") {
                                        //         //   // RouteManagement.goToViewAllImgVidScreen(controller.imageDetailsDocList, index);
                                        //         // } else if (fileType ==
                                        //         //     "video") {
                                        //         //   // RouteManagement.goToSingleFullScreenImageVideo(ApiWrapper.imageUrl + (item.fileurl ?? ""), 'Video');
                                        //         // } else if (fileType ==
                                        //         //     "folder") {
                                        //         //   controller.isClick = false;
                                        //         //   controller.isFolderLoading =
                                        //         //       true;
                                        //         //   controller.update();
                                        //         //   // controller.addNewStep(item);
                                        //         // } else {}
                                        //       },
                                        //       child: Container(
                                        //         padding:
                                        //             fileType != "image"
                                        //                 ? Dimens.edgeInsets5
                                        //                 : Dimens.edgeInsets0,
                                        //         decoration: BoxDecoration(
                                        //           color: Colors.white,
                                        //           borderRadius:
                                        //               BorderRadius.circular(
                                        //                 Dimens.twenty,
                                        //               ),
                                        //           border: Border.all(
                                        //             color:
                                        //                 ColorsValue.lightCBD5E1,
                                        //           ),
                                        //         ),
                                        //         child: Builder(
                                        //           builder: (context) {
                                        //             if (fileType == "image") {
                                        //               // final ext =
                                        //               //     Utility.getFileTypeFromUrl(
                                        //               //       item.fileurl ??
                                        //               //           "",
                                        //               //     );
                                        //               return ClipRRect(
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(
                                        //                       Dimens.ten,
                                        //                     ),
                                        //                 child: Stack(
                                        //                   children: [
                                        //                     Stack(
                                        //                       children: [
                                        //                         CachedNetworkImage(
                                        //                           imageUrl:
                                        //                               item.image,
                                        //                           fit:
                                        //                               BoxFit
                                        //                                   .cover,
                                        //                           height:
                                        //                               double
                                        //                                   .infinity,
                                        //                           width:
                                        //                               double
                                        //                                   .infinity,
                                        //                           placeholder:
                                        //                               (
                                        //                                 context,
                                        //                                 url,
                                        //                               ) => Image.asset(
                                        //                                 AssetConstants
                                        //                                     .placeholder,
                                        //                                 fit:
                                        //                                     BoxFit
                                        //                                         .cover,
                                        //                               ),
                                        //                           errorWidget:
                                        //                               (
                                        //                                 context,
                                        //                                 url,
                                        //                                 error,
                                        //                               ) => Image.asset(
                                        //                                 AssetConstants
                                        //                                     .placeholder,
                                        //                                 fit:
                                        //                                     BoxFit
                                        //                                         .cover,
                                        //                               ),
                                        //                         ),
                                        //                         Padding(
                                        //                           padding: Dimens
                                        //                               .edgeInsets0
                                        //                               .copyWith(
                                        //                                 left: 10,
                                        //                                 bottom:
                                        //                                     10,
                                        //                               ),
                                        //                           child: Align(
                                        //                             alignment:
                                        //                                 AlignmentGeometry
                                        //                                     .bottomLeft,
                                        //                             child: Container(
                                        //                               padding: Dimens
                                        //                                   .edgeInsets0
                                        //                                   .copyWith(
                                        //                                     left:
                                        //                                         8,
                                        //                                     right:
                                        //                                         8,
                                        //                                     bottom:
                                        //                                         4,
                                        //                                   ),
                                        //                               decoration: BoxDecoration(
                                        //                                 color:
                                        //                                     ColorsValue
                                        //                                         .whiteColor,
                                        //                                 border: Border.all(
                                        //                                   color:
                                        //                                       ColorsValue.blackColor,
                                        //                                 ),
                                        //                                 borderRadius:
                                        //                                     BorderRadius.circular(
                                        //                                       4,
                                        //                                     ),
                                        //                               ),
                                        //                               child: Text(
                                        //                                 'ext',
                                        //                                 style: Styles.appColorW60014.copyWith(
                                        //                                   fontSize:
                                        //                                       14,
                                        //                                   fontWeight:
                                        //                                       FontWeight.w500,
                                        //                                   color:
                                        //                                       ColorsValue.color0F172A,
                                        //                                 ),
                                        //                               ),
                                        //                             ),
                                        //                           ),
                                        //                         ),
                                        //                       ],
                                        //                     ),
                                        //                   ],
                                        //                 ),
                                        //               );
                                        //             } else if (fileType ==
                                        //                 "video") {
                                        //               return Stack(children: [
                                        //                     ],
                                        //                   );
                                        //               // else if (fileType ==
                                        //               //     "document") {
                                        //               //   String icon = '';
                                        //               //   // final ext =
                                        //               //   //     Utility.getFileTypeFromUrl(
                                        //               //   //       item.fileurl ??
                                        //               //   //           "",
                                        //               //   //     );
                                        //               //   if ([
                                        //               //     "doc",
                                        //               //     "docx",
                                        //               //   ].contains(ext)) {
                                        //               //     icon =
                                        //               //         AssetConstants
                                        //               //             .word_icon;
                                        //               //   } else if ([
                                        //               //     "xls",
                                        //               //     "xlsx",
                                        //               //     "csv",
                                        //               //   ].contains(ext)) {
                                        //               //     icon =
                                        //               //         AssetConstants
                                        //               //             .excel_icon;
                                        //               //   } else if ([
                                        //               //     "ppt",
                                        //               //     "pptx",
                                        //               //   ].contains(ext)) {
                                        //               //     icon =
                                        //               //         AssetConstants
                                        //               //             .ppt_icon;
                                        //               //   } else if ([
                                        //               //     "zip",
                                        //               //     "rar",
                                        //               //   ].contains(ext)) {
                                        //               //     icon =
                                        //               //         AssetConstants
                                        //               //             .zip_icon;
                                        //               //   } else if ([
                                        //               //     "gif",
                                        //               //   ].contains(ext)) {
                                        //               //     icon =
                                        //               //         AssetConstants
                                        //               //             .gif_icon;
                                        //               //   } else if ([
                                        //               //     "pdf",
                                        //               //   ].contains(ext)) {
                                        //               //     icon =
                                        //               //         AssetConstants
                                        //               //             .zip_icon;
                                        //               //     // .word_icon;
                                        //               //     // .excel_icon;
                                        //               //     // .ppt_icon;
                                        //               //     // .gif_icon;
                                        //               //   } else {
                                        //               //     icon =
                                        //               //         AssetConstants
                                        //               //             .app_logo;
                                        //               //   }
                                        //               //   return Stack(
                                        //               //     children: [
                                        //               //       Center(
                                        //               //         child:
                                        //               //             SvgPicture.asset(
                                        //               //               icon,
                                        //               //             ),
                                        //               //       ),
                                        //               //       if (controller
                                        //               //           .isLongPress)
                                        //               //         Positioned(
                                        //               //           right: 0,
                                        //               //           child: Transform.scale(
                                        //               //             scale: 1.2,
                                        //               //             child: Checkbox(
                                        //               //               value:
                                        //               //                   item.isSelect,
                                        //               //               activeColor:
                                        //               //                   ColorsValue
                                        //               //                       .appColor,
                                        //               //               onChanged: (
                                        //               //                 value,
                                        //               //               ) {
                                        //               //                 item.isSelect =
                                        //               //                     value!;
                                        //               //                 controller
                                        //               //                     .updateSelectedCount();
                                        //               //                 controller
                                        //               //                     .update();
                                        //               //               },
                                        //               //             ),
                                        //               //           ),
                                        //               //         ),
                                        //               //     ],
                                        //               //   );
                                        //             } else {
                                        //               return Center(
                                        //                 child: SvgPicture.asset(
                                        //                   AssetConstants
                                        //                       .ic_document,
                                        //                   height: 50,
                                        //                 ),
                                        //               );
                                        //             }
                                        //           },
                                        //         ),
                                        //       ),
                                        //     );
                                        //   },
                                        // )
                                      )
                                      : const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                  : Center(
                                    child: Text(
                                      "Media data not found....!",
                                      style: Styles.txtBlackColorW60016
                                          .copyWith(fontSize: Dimens.eighteen),
                                    ),
                                  ),
                          // : Center(child: CircularProgressIndicator()),
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
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String designNo;
  final String tagno;
  final String code;
  final String imageUrl;
  final String gw;
  final String dw;
  final String ow;
  final String nw;
  final String kt;
  final bool isSelected;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.designNo,
    required this.tagno,
    required this.code,
    required this.imageUrl,
    required this.gw,
    required this.dw,
    required this.ow,
    required this.nw,
    required this.kt,
    this.isSelected = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Dimens.edgeInsets10,
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: ColorsValue.textFieldBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? ColorsValue.greyCBD5E1 : ColorsValue.greyColor,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: Dimens.edgeInsets5,
                    decoration: BoxDecoration(
                      color: ColorsValue.colorDFEFEF,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                      child: Text(
                        tagno,
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorsValue.txtBlackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Design No. :- ",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorsValue.txtBlackColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                designNo,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: ColorsValue.lineColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Icon(
                      //   Icons.check_circle,
                      //   color: isSelected ? Colors.blue : Colors.grey,
                      //   size: 20,
                      // ),
                    ],
                  ),
                  Dimens.boxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _labelValue("G.W", gw),
                      const SizedBox(width: 20),
                      _labelValue("D.W", dw),
                    ],
                  ),
                  Dimens.boxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _labelValue("O.W", ow),
                      const SizedBox(width: 20),
                      _labelValue("N.W", nw),
                    ],
                  ),
                  Dimens.boxHeight10,
                  _labelValue("KT", kt),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _labelValue(String label, String value) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: "$label :- ",
        style: TextStyle(
          fontSize: 14,
          color: ColorsValue.txtBlackColor,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 14,
              color: ColorsValue.lineColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

Future showDeleteDialog(
  BuildContext context, {
  required List<String> selectedIndex,
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
              'Are You Sure You Want To Delete File?',
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
            onPressed: () {
              // controller.deleteFiles(fileIds: selectedIndex);
            },
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

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: const Color(0xFFD2A679),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      icon: const Icon(Icons.upload_rounded, color: Colors.white),
      label: const Text(
        "Upload File",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
