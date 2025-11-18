import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/models/getAll_product_model.dart';
import 'package:a_nxt/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SalesAnalyticsProductScreen extends StatelessWidget {
  const SalesAnalyticsProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) {},
      builder: (controller) {
        final user = controller.getOneUser;
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: user?.name ?? " - ",
            isCenter: true,
            actions: [
              TextButton(
                onPressed: () {
                  showAddOrEditProductDialog(context, controller: controller);
                },
                child: Text("Add Product", style: Styles.appColorW50016),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets20,
            child: CustomButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return Material(
                      color: ColorsValue.transparent,
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          bool showError = false;

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: Dimens.edgeInsets20,
                                padding: Dimens.edgeInsets20,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: ColorsValue.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                    Dimens.ten,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          user?.name ?? " - ",
                                          style: Styles.txtBlackColorW60016,
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.back(),
                                          child: SvgPicture.asset(
                                            AssetConstants.ic_close,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight10,
                                    Text(
                                      "Status",
                                      style: Styles.txtBlackColorW70014,
                                    ),
                                    Dimens.boxHeight4,
                                    Container(
                                      padding: Dimens.edgeInsets20_00_20_00,
                                      height:
                                          Utility.isTablet()
                                              ? Dimens.sixtyFive
                                              : Dimens.fifty,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorsValue.textFieldBg,
                                        borderRadius: BorderRadius.circular(
                                          Dimens.ten,
                                        ),
                                        border:
                                            showError &&
                                                    controller.selectStatus ==
                                                        null
                                                ? Border.all(color: Colors.red)
                                                : null,
                                      ),
                                      child: DropdownButton<String>(
                                        underline: Container(),
                                        isDense: true,
                                        isExpanded: true,
                                        value: controller.selectStatus,
                                        hint: Text('Select Status'),
                                        onChanged: (value) {
                                          controller.selectStatus = value;
                                          controller.selectPiliStatus = null;
                                          controller.nextDateController.clear();
                                          showError = false;
                                          controller.update();
                                          setState(() {});
                                        },
                                        items:
                                            controller.statusList
                                                .map(
                                                  (option) => DropdownMenuItem(
                                                    value: option,
                                                    child: Text(option),
                                                  ),
                                                )
                                                .toList(),
                                      ),
                                    ),
                                    Dimens.boxHeight10,
                                    if (controller.selectStatus == 'pili') ...[
                                      Text(
                                        "Pili Status",
                                        style: Styles.txtBlackColorW70014,
                                      ),
                                      Dimens.boxHeight4,
                                      Container(
                                        padding: Dimens.edgeInsets20_00_20_00,
                                        height:
                                            Utility.isTablet()
                                                ? Dimens.sixtyFive
                                                : Dimens.fifty,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: ColorsValue.textFieldBg,
                                          borderRadius: BorderRadius.circular(
                                            Dimens.ten,
                                          ),
                                          border:
                                              showError &&
                                                      controller
                                                              .selectPiliStatus ==
                                                          null
                                                  ? Border.all(
                                                    color: Colors.red,
                                                  )
                                                  : null,
                                        ),
                                        child: DropdownButton<String>(
                                          underline: Container(),
                                          isExpanded: true,
                                          value: controller.selectPiliStatus,
                                          hint: Text("Select Pili Status"),
                                          onChanged: (value) {
                                            controller.selectPiliStatus = value;
                                            showError = false;
                                            controller.update();
                                            setState(() {});
                                          },
                                          items:
                                              controller.piliStatus
                                                  .map(
                                                    (option) =>
                                                        DropdownMenuItem(
                                                          value: option,
                                                          child: Text(option),
                                                        ),
                                                  )
                                                  .toList(),
                                        ),
                                      ),
                                      Dimens.boxHeight10,
                                      CustomTextFormField(
                                        controller:
                                            controller.nextDateController,
                                        isTitle: true,
                                        readOnly: true,
                                        title: "Next Date",
                                        titleStyle: Styles.txtBlackColorW70014,
                                        hintText: 'Enter Next Date',
                                        hintStyle: Styles.txtGreyColorW50012,
                                        filled: true,
                                        fillColor: ColorsValue.textFieldBg,
                                        suffixIcon: Padding(
                                          padding: Dimens.edgeInsets10,
                                          child: InkWell(
                                            onTap: () async {
                                              controller.nextDate =
                                                  await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        controller.nextDate ??
                                                        DateTime.now(),
                                                    firstDate: DateTime(1920),
                                                    lastDate: DateTime(2100),
                                                  );

                                              if (controller.nextDate != null) {
                                                controller
                                                    .nextDateController
                                                    .text = DateFormat(
                                                  "yyyy-MM-dd",
                                                ).format(controller.nextDate!);
                                                showError = false;
                                                controller.update();
                                                setState(() {});
                                              }
                                            },
                                            child: SvgPicture.asset(
                                              AssetConstants.ic_date,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    Dimens.boxHeight20,
                                    CustomButton(
                                      heightBtn: Dimens.fifty,
                                      radius: Dimens.zero,
                                      onPressed: () {
                                        if (controller.selectStatus == null) {
                                          showError = true;
                                          rootScaffoldMessengerKey.currentState
                                              ?.showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Please select Status',
                                                    style:
                                                        Styles.whiteColorW50014,
                                                  ),
                                                  backgroundColor: Colors.red,
                                                  dismissDirection:
                                                      DismissDirection.up,
                                                ),
                                              );

                                          setState(() {});
                                          return;
                                        }

                                        if (controller.selectStatus == 'pili') {
                                          if (controller.selectPiliStatus ==
                                                  null ||
                                              controller
                                                  .selectPiliStatus!
                                                  .isEmpty ||
                                              controller
                                                  .nextDateController
                                                  .text
                                                  .isEmpty) {
                                            showError = true;
                                            rootScaffoldMessengerKey
                                                .currentState
                                                ?.showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Pili Status and Next Date are required',
                                                      style:
                                                          Styles
                                                              .whiteColorW50014,
                                                    ),
                                                    backgroundColor: Colors.red,
                                                    dismissDirection:
                                                        DismissDirection.up,
                                                  ),
                                                );
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        // All Good → Submit
                                        controller.update();
                                        controller.postSalesCreate(mode: "all");
                                      },
                                      text: 'Save',
                                      textStyle: Styles.whiteColorW60016,
                                      backgroundColor: ColorsValue.appColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                );
              },
              text: "Save",
              textStyle: Styles.whiteColorW60016,
              backgroundColor: ColorsValue.appColor,
              heightBtn: Dimens.fifty,
              radius: Dimens.zero,
            ),
          ),
          body: ListView(
            padding: Dimens.edgeInsets20_10_20_20,
            physics: ClampingScrollPhysics(),
            children: [
              SizedBox(
                height: Dimens.fourty,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: ColorsValue.lightAppColor,
                        alignment: Alignment.center,
                        child: Text(
                          "Product",
                          style: Styles.txtBlackColorW60014,
                        ),
                      ),
                    ),
                    Container(
                      width: Dimens.one,
                      height: Dimens.fourty,
                      color: ColorsValue.greyD9D9D9,
                    ),
                    Expanded(
                      child: Container(
                        color: ColorsValue.lightAppColor,
                        alignment: Alignment.center,
                        child: Text(
                          "Weight",
                          style: Styles.txtBlackColorW60014,
                        ),
                      ),
                    ),
                    // Container(height: Dimens.fourty, width: Dimens.one, color: ColorsValue.greyD9D9D9),
                    // Expanded(
                    //   child: Container(
                    //     color: ColorsValue.lightAppColor,
                    //     alignment: Alignment.center,
                    //     child: Text("Status", style: Styles.txtBlackColorW60014),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Divider(color: ColorsValue.greyD9D9D9, height: Dimens.one),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final element = controller.productList[index];
                  return SizedBox(
                    height: Dimens.fourty,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: ColorsValue.textFieldBg,
                            alignment: Alignment.center,
                            child: Text(
                              element.productName,
                              style: Styles.txtBlackColorW60014,
                            ),
                          ),
                        ),
                        Container(
                          width: Dimens.one,
                          height: Dimens.fourty,
                          color: ColorsValue.greyD9D9D9,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showAddOrEditProductDialog(
                                context,
                                controller: controller,
                                editIndex: index,
                              );
                              controller.update();
                            },
                            child: Container(
                              color: ColorsValue.textFieldBg,
                              alignment: Alignment.center,
                              child: Text(
                                element.weight.toString(),
                                style: Styles.txtBlackColorW60014,
                              ),
                            ),
                          ),
                        ),
                        // Container(height: Dimens.fourty, width: Dimens.one, color: ColorsValue.greyD9D9D9),
                        // Expanded(
                        //   child: Container(
                        //     color: ColorsValue.textFieldBg,
                        //     alignment: Alignment.center,
                        //     child: Text("Status", style: Styles.txtBlackColorW60014),
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: ColorsValue.greyD9D9D9,
                    height: Dimens.one,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showAddOrEditProductDialog(
    BuildContext context, {
    int? editIndex,
    required SalesAnalyticsController controller,
  }) {
    final isEdit = editIndex != null;

    if (isEdit) {
      final product = controller.productList[editIndex];
      controller.selectProduct = controller.getProductList.firstWhere(
        (p) => p.productname == product.productName,
        orElse: () => controller.getProductList.first,
      );
      controller.weightController.text = product.weight.toString();
    } else {
      controller.selectProduct = null;
      controller.weightController.clear();
    }

    // Get.dialog(
    //   // barrierDismissible: false,
    //   // context: context,
    //   // builder: (context) {
    //     // return
    //     Material(
    //       color: ColorsValue.transparent,
    //       child: StatefulBuilder(
    //         builder: (context, setState) {
    //           return Column(
    //             mainAxisSize: MainAxisSize.min,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Container(
    //                 margin: Dimens.edgeInsets20,
    //                 padding: Dimens.edgeInsets20,
    //                 width: double.maxFinite,
    //                 decoration: BoxDecoration(
    //                   color: ColorsValue.whiteColor,
    //                   borderRadius: BorderRadius.circular(Dimens.ten),
    //                 ),
    //                 child: Column(
    //                   mainAxisSize: MainAxisSize.min,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text(
    //                           isEdit ? "Edit Product" : "Add Product",
    //                           style: Styles.txtBlackColorW60016,
    //                         ),
    //                         GestureDetector(
    //                           onTap: () => Get.back(),
    //                           child: SvgPicture.asset(AssetConstants.ic_close),
    //                         ),
    //                       ],
    //                     ),
    //                     Dimens.boxHeight10,
    //                     Container(
    //                       padding: Dimens.edgeInsets20_00_20_00,
    //                       height:
    //                           Utility.isTablet()
    //                               ? Dimens.sixtyFive
    //                               : Dimens.fifty,
    //                       alignment: Alignment.center,
    //                       decoration: BoxDecoration(
    //                         color: ColorsValue.textFieldBg,
    //                         borderRadius: BorderRadius.circular(Dimens.ten),
    //                       ),
    //                       child: DropdownButton<ProductListDoc>(
    //                         underline: Container(),
    //                         isDense: true,
    //                         isExpanded: true,
    //                         onChanged: (value) {
    //                           controller.selectProduct = value!;
    //                           controller.update();
    //                           setState(() {});
    //                         },
    //                         hint: Text(
    //                           'Product'.tr,
    //                           style: Styles.txtGreyColorW50012.copyWith(
    //                             fontSize:
    //                                 Utility.isTablet()
    //                                     ? Dimens.eighteen
    //                                     : Dimens.fourteen,
    //                           ),
    //                         ),
    //                         focusColor: Colors.white,
    //                         dropdownColor: ColorsValue.whiteColor,
    //                         value: controller.selectProduct,
    //                         style: Styles.txtBlackColorW50014,
    //                         iconEnabledColor: Colors.black,
    //                         icon: Icon(
    //                           Icons.keyboard_arrow_down_rounded,
    //                           size: Dimens.twenty,
    //                         ),
    //                         items:
    //                             controller.getProductList.map((option) {
    //                               return DropdownMenuItem(
    //                                 value: option,
    //                                 child: Text(
    //                                   option.productname,
    //                                   style: Styles.txtBlackColorW50014
    //                                       .copyWith(
    //                                         fontSize:
    //                                             Utility.isTablet()
    //                                                 ? Dimens.twenty
    //                                                 : Dimens.fourteen,
    //                                       ),
    //                                 ),
    //                               );
    //                             }).toList(),
    //                       ),
    //                     ),
    //                     Dimens.boxHeight20,
    //                     CustomTextFormField(
    //                       controller: controller.weightController,
    //                       isTitle: true,
    //                       title: "Add Weight",
    //                       titleStyle: Styles.txtBlackColorW70014,
    //                       hintText: 'Enter Weight',
    //                       hintStyle: Styles.txtGreyColorW50012,
    //                       filled: true,
    //                       fillColor: ColorsValue.textFieldBg,
    //                       textInputAction: TextInputAction.next,
    //                       keyboardType: TextInputType.number,
    //                     ),
    //                     Dimens.boxHeight20,
    //                     CustomButton(
    //                       heightBtn: Dimens.fifty,
    //                       radius: Dimens.zero,
    //                       onPressed: () {
    //                         if (controller.selectProduct == null) {
    //                           rootScaffoldMessengerKey.currentState
    //                               ?.showSnackBar(
    //                                 SnackBar(
    //                                   behavior: SnackBarBehavior.floating,
    //                                   margin: const EdgeInsets.only(
    //                                     top: 10,
    //                                     left: 16,
    //                                     right: 16,
    //                                   ),
    //                                   content: Text('Please select a product'),
    //                                   backgroundColor: ColorsValue.appBg,
    //                                 ),
    //                               );
    //                           return;
    //                         }

    //                         if (controller.weightController.text
    //                             .trim()
    //                             .isEmpty) {
    //                           rootScaffoldMessengerKey.currentState
    //                               ?.showSnackBar(
    //                                 SnackBar(
    //                                   content: Text('Please enter weight'),
    //                                   backgroundColor: ColorsValue.appColor,
    //                                 ),
    //                               );
    //                           // Utility.snacBar(
    //                           //   'Please enter weight',
    //                           //   ColorsValue.appColor,
    //                           // );
    //                           return;
    //                         }

    //                         final weight = num.tryParse(
    //                           controller.weightController.text.trim(),
    //                         );
    //                         if (weight == null || weight <= 0) {
    //                           rootScaffoldMessengerKey.currentState
    //                               ?.showSnackBar(
    //                                 SnackBar(
    //                                   content: Text(
    //                                     'Please enter a valid weight',
    //                                   ),
    //                                   backgroundColor: ColorsValue.appColor,
    //                                 ),
    //                               );

    //                           // Utility.snacBar(
    //                           //   'Please enter a valid weight',
    //                           //   ColorsValue.appColor,
    //                           // );
    //                           return;
    //                         }

    //                         if (isEdit) {
    //                           controller.productList[editIndex] = ProductModel(
    //                             productName:
    //                                 controller.selectProduct?.productname ?? '',
    //                             weight:
    //                                 int.tryParse(
    //                                   controller.weightController.text,
    //                                 ) ??
    //                                 0,
    //                             productID: controller.selectProduct?.id ?? '',
    //                           );
    //                         } else {
    //                           controller.productList.add(
    //                             ProductModel(
    //                               productName:
    //                                   controller.selectProduct?.productname ??
    //                                   '',
    //                               weight:
    //                                   num.tryParse(
    //                                     controller.weightController.text,
    //                                   ) ??
    //                                   0,
    //                               productID: controller.selectProduct?.id ?? '',
    //                             ),
    //                           );
    //                         }

    //                         controller.weightController.clear();
    //                         controller.selectProduct = null;
    //                         controller.update();
    //                         Get.back();
    //                       },
    //                       text: isEdit ? 'Update' : 'Save',
    //                       textStyle: Styles.whiteColorW60016,
    //                       backgroundColor: ColorsValue.appColor,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           );
    //         },
    //       ),
    //     )
    //   // },
    // );

    Get.dialog(
      Material(
        color: ColorsValue.transparent,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: Dimens.edgeInsets20,
                  padding: Dimens.edgeInsets20,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorsValue.whiteColor,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ---------- Header ----------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isEdit ? "Edit Product" : "Add Product",
                            style: Styles.txtBlackColorW60016,
                          ),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: SvgPicture.asset(AssetConstants.ic_close),
                          ),
                        ],
                      ),

                      Dimens.boxHeight10,

                      // ---------- Dropdown ----------
                      Container(
                        padding: Dimens.edgeInsets20_00_20_00,
                        height:
                            Utility.isTablet()
                                ? Dimens.sixtyFive
                                : Dimens.fifty,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorsValue.textFieldBg,
                          borderRadius: BorderRadius.circular(Dimens.ten),
                        ),
                        child: DropdownButton<ProductListDoc>(
                          underline: Container(),
                          isDense: true,
                          isExpanded: true,
                          onChanged: (value) {
                            controller.selectProduct = value!;
                            controller.update();
                            setState(() {});
                          },
                          hint: Text('Product'.tr),
                          value: controller.selectProduct,
                          items:
                              controller.getProductList.map((option) {
                                return DropdownMenuItem(
                                  value: option,
                                  child: Text(option.productname),
                                );
                              }).toList(),
                        ),
                      ),

                      Dimens.boxHeight20,

                      // ---------- Weight ----------
                      CustomTextFormField(
                        controller: controller.weightController,
                        isTitle: true,
                        title: "Add Weight",
                        hintText: 'Enter Weight',
                        filled: true,
                        fillColor: ColorsValue.textFieldBg,
                        keyboardType: TextInputType.number,
                      ),

                      Dimens.boxHeight20,

                      // ---------- Save Button ----------
                      CustomButton(
                        heightBtn: Dimens.fifty,
                        onPressed: () {
                          // ---------------- Validation ----------------
                          if (controller.selectProduct == null) {
                            rootScaffoldMessengerKey.currentState?.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select a product',
                                  style: Styles.whiteColorW50014,
                                ),
                                backgroundColor: Colors.red,
                                dismissDirection: DismissDirection.up,
                              ),
                            );
                            // Utility.showTopSnack(
                            //   "Error",
                            //   "Please select a product",
                            //   snackPosition: SnackPosition.TOP,
                            //   backgroundColor: Colors.red,
                            // );
                            return;
                          }

                          if (controller.weightController.text.trim().isEmpty) {
                            rootScaffoldMessengerKey.currentState?.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please enter weight',
                                  style: Styles.whiteColorW50014,
                                ),
                                backgroundColor: Colors.red,
                                dismissDirection: DismissDirection.up,
                              ),
                            );
                            return;
                          }

                          final weight = num.tryParse(
                            controller.weightController.text.trim(),
                          );

                          if (weight == null || weight <= 0) {
                            rootScaffoldMessengerKey.currentState?.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please enter a valid weight',
                                  style: Styles.whiteColorW50014,
                                ),
                                backgroundColor: Colors.red,
                                dismissDirection: DismissDirection.up,
                              ),
                            );
                            return;
                          }

                          // SAVE / UPDATE LOGIC...

                          controller.weightController.clear();
                          controller.selectProduct = null;
                          controller.update();
                          Get.back();
                        },
                        text: isEdit ? 'Update' : 'Save',
                        backgroundColor: ColorsValue.appColor,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      barrierDismissible: false,
    );
  }
}
