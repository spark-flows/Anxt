import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddExpenseTripScreen extends StatelessWidget {
  const AddExpenseTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TripController>(
      initState: (state) {
        var controller = Get.find<TripController>();
        controller.expenseid = Get.arguments;
        controller.getExpenseCategory();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title:
                controller.expenseid != null ? "Edit Expanse" : "Add Expanse",
            isCenter: true,
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: Dimens.edgeInsets20_10_20_10,
              child: CustomButton(
                onPressed: () {
                  controller.postExpenseCreate();
                },
                text:
                    controller.expenseid != null
                        ? "Edit Expanse"
                        : "Add Expanse",
                backgroundColor: ColorsValue.appColor,
                textStyle: Styles.whiteColorW60016,
                radius: Dimens.zero,
              ),
            ),
          ),
          body: Form(
            key: controller.addTripKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: Dimens.edgeInsets20_10_20_20,
              physics: ClampingScrollPhysics(),
              children: [
                CustomTextFormField(
                  controller: controller.titleController,
                  isTitle: true,
                  title: "Title",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Title',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.dateController,
                  isTitle: true,
                  title: "Date",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Date',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  readOnly: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,

                  keyboardType: TextInputType.datetime,
                  suffixIcon: Padding(
                    padding: Dimens.edgeInsets10,
                    child: InkWell(
                      onTap: () async {
                        controller.dateTime = null;
                        controller.dateTime = await showDatePicker(
                          context: context,
                          initialDate: controller.dateTime,
                          firstDate: DateTime(1920),
                          lastDate: DateTime(2100),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );
                        if (controller.dateTime != null) {
                          controller.dateController.text = DateFormat(
                            "yyyy-MM-dd",
                          ).format(controller.dateTime ?? DateTime.now());
                          controller.update();
                        }
                      },
                      child: SvgPicture.asset(AssetConstants.ic_date),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Expense Category'.tr,
                    style: Styles.txtBlackColorW70014.copyWith(
                      fontSize:
                          Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                    ),
                  ),
                ),
                Dimens.boxHeight5,
                Container(
                  padding: Dimens.edgeInsets20_00_20_00,
                  height: Utility.isTablet() ? Dimens.sixtyFive : Dimens.fifty,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorsValue.textFieldBg,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    isDense: true,
                    isExpanded: true,
                    onChanged: (value) {
                      controller.selectExpenseCategory = value!;
                      controller.update();
                    },
                    hint: Text(
                      'Select Expense Category'.tr,
                      style: Styles.txtGreyColorW50012.copyWith(
                        fontSize:
                            Utility.isTablet()
                                ? Dimens.eighteen
                                : Dimens.fourteen,
                      ),
                    ),
                    focusColor: Colors.white,
                    dropdownColor: ColorsValue.whiteColor,
                    value: controller.selectExpenseCategory,
                    style: Styles.txtBlackColorW50014,
                    iconEnabledColor: Colors.black,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: Dimens.twenty,
                    ),
                    items:
                        controller.expanceCategoryList.isNotEmpty
                            ? controller.expanceCategoryList.map((option) {
                              return DropdownMenuItem(
                                value: option.id,
                                child: Text(
                                  option?.name ?? "",
                                  style: Styles.txtBlackColorW50014.copyWith(
                                    fontSize:
                                        Utility.isTablet()
                                            ? Dimens.twenty
                                            : Dimens.fourteen,
                                  ),
                                ),
                              );
                            }).toList()
                            : [],
                  ),
                ),
                Dimens.boxHeight20,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Select User'.tr,
                    style: Styles.txtBlackColorW70014.copyWith(
                      fontSize:
                          Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                    ),
                  ),
                ),
                Dimens.boxHeight5,
                Container(
                  padding: Dimens.edgeInsets20_00_20_00,
                  height: Utility.isTablet() ? Dimens.sixtyFive : Dimens.fifty,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorsValue.textFieldBg,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    isDense: true,
                    isExpanded: true,
                    onChanged: (value) {
                      controller.selectExpenseUser = value!;
                      controller.update();
                    },
                    hint: Text(
                      'Select User'.tr,
                      style: Styles.txtGreyColorW50012.copyWith(
                        fontSize:
                            Utility.isTablet()
                                ? Dimens.eighteen
                                : Dimens.fourteen,
                      ),
                    ),
                    focusColor: Colors.white,
                    dropdownColor: ColorsValue.whiteColor,
                    value: controller.selectExpenseUser,
                    style: Styles.txtBlackColorW50014,
                    iconEnabledColor: Colors.black,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: Dimens.twenty,
                    ),
                    items:
                        controller.getOneTripData?.participants?.isNotEmpty ??
                                false
                            ? controller.getOneTripData?.participants?.map((
                              option,
                            ) {
                              return DropdownMenuItem(
                                value: option.id,
                                child: Text(
                                  option?.name ?? "",
                                  style: Styles.txtBlackColorW50014.copyWith(
                                    fontSize:
                                        Utility.isTablet()
                                            ? Dimens.twenty
                                            : Dimens.fourteen,
                                  ),
                                ),
                              );
                            }).toList()
                            : [],
                  ),
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.amountController,
                  isTitle: true,
                  title: "Amount",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Amount',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                // Dimens.boxHeight20,
                // CustomTextFormField(
                //   controller: controller.remarkController,
                //   isTitle: true,
                //   title: "Remark",
                //   titleStyle: Styles.txtBlackColorW70014,
                //   hintText: 'Enter Remark',
                //   hintStyle: Styles.txtGreyColorW50012,
                //   filled: true,
                //   readOnly: true,
                //   fillColor: ColorsValue.textFieldBg,
                //   textInputAction: TextInputAction.done,
                //   keyboardType: TextInputType.text,
                // ),
                Dimens.boxHeight20,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Receipt/Invoice'.tr,
                    style: Styles.txtBlackColorW70014.copyWith(
                      fontSize:
                          Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                    ),
                  ),
                ),
                Dimens.boxHeight5,
                UploadWidgets(
                  txt: 'Upload File',
                  height: Dimens.fifty,
                  onTap: () {
                    controller.uploadinvoice();
                  },
                  bgColor: ColorsValue.textFieldBg,
                  svgPicture: AssetConstants.ic_export,
                ),
                if (controller.selectInvoice != null) ...[
                  InkWell(
                    onTap: () {
                      RouteManagement.goToShowFullScareenImage(
                        controller.selectInvoice,
                        "Image",
                      );
                    },
                    child: Image.network(
                      controller.selectInvoice ?? "",
                      fit: BoxFit.cover,
                      height: Dimens.hundred,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AssetConstants.placeholder,
                          height: Dimens.hundred,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
