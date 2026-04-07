import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTripScreen extends StatelessWidget {
  const AddTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TripController>(
      initState: (state) {
        var controller = Get.find<TripController>();
        controller.getAllUser();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Add Trip",
            isCenter: true,
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: Dimens.edgeInsets20_10_20_10,
              child: CustomButton(
                onPressed: () {
                  controller.postCreateTrip();
                },
                text: 'Save',
                backgroundColor: ColorsValue.appColor,
                textStyle: Styles.whiteColorW60016,
                radius: Dimens.zero,
              ),
            ),
          ),
          body: Form(
            key: controller.expenseTripKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: Dimens.edgeInsets20_10_20_20,
              physics: ClampingScrollPhysics(),
              children: [
                CustomTextFormField(
                  controller: controller.nameController,
                  isTitle: true,
                  title: "Trip Name",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Trip Name',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.purposeController,
                  isTitle: true,
                  title: "Purpose",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Purpose',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Status'.tr,
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
                      controller.selectStatus = value!;
                      controller.update();
                    },
                    hint: Text(
                      'Select Status'.tr,
                      style: Styles.txtGreyColorW50012.copyWith(
                        fontSize:
                            Utility.isTablet()
                                ? Dimens.eighteen
                                : Dimens.fourteen,
                      ),
                    ),
                    focusColor: Colors.white,
                    dropdownColor: ColorsValue.whiteColor,
                    value: controller.selectStatus,
                    style: Styles.txtBlackColorW50014,
                    iconEnabledColor: Colors.black,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: Dimens.twenty,
                    ),
                    items:
                        controller.statusCandidateList.isNotEmpty
                            ? controller.statusCandidateList.map((option) {
                              return DropdownMenuItem(
                                value: option.title,
                                child: Text(
                                  option?.title?.capitalizeFirst ?? "",
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
                  controller: controller.budgetController,
                  isTitle: true,
                  title: "Estimated Budget",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Estimated Budget',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                Dimens.boxHeight20,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Currency'.tr,
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
                      controller.selectCurrency = value!;
                      controller.update();
                    },
                    hint: Text(
                      'Select Currency'.tr,
                      style: Styles.txtGreyColorW50012.copyWith(
                        fontSize:
                            Utility.isTablet()
                                ? Dimens.eighteen
                                : Dimens.fourteen,
                      ),
                    ),
                    focusColor: Colors.white,
                    dropdownColor: ColorsValue.whiteColor,
                    value: controller.selectCurrency,
                    style: Styles.txtBlackColorW50014,
                    iconEnabledColor: Colors.black,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: Dimens.twenty,
                    ),
                    items:
                        controller.currencyList.isNotEmpty
                            ? controller.currencyList.map((option) {
                              return DropdownMenuItem(
                                value: option,
                                child: Text(
                                  option ?? "",
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
                  controller: controller.startDateController,
                  isTitle: true,
                  title: "Start Date",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Start Date',
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
                        controller.startDateTime = null;
                        controller.startDateTime = await showDatePicker(
                          context: context,
                          initialDate: controller.startDateTime,
                          firstDate: DateTime(1920),
                          lastDate: DateTime(2100),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );
                        if (controller.startDateTime != null) {
                          controller.startDateController.text = DateFormat(
                            "yyyy-MM-dd",
                          ).format(controller.startDateTime ?? DateTime.now());
                          controller.update();
                        }
                      },
                      child: SvgPicture.asset(AssetConstants.ic_date),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.endDateController,
                  isTitle: true,
                  title: "End Date",
                  readOnly: true,
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter End Date',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
                  suffixIcon: Padding(
                    padding: Dimens.edgeInsets10,
                    child: InkWell(
                      onTap: () async {
                        controller.endDateTime = null;
                        controller.endDateTime = await showDatePicker(
                          context: context,
                          initialDate: controller.endDateTime,
                          firstDate: DateTime(1920),
                          lastDate: DateTime(2100),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );
                        if (controller.endDateTime != null) {
                          controller.endDateController.text = DateFormat(
                            "yyyy-MM-dd",
                          ).format(controller.endDateTime ?? DateTime.now());
                          controller.update();
                        }
                      },
                      child: SvgPicture.asset(AssetConstants.ic_date),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.locationController,
                  isTitle: true,
                  title: "Location",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Location',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.remarkAddController,
                  isTitle: true,
                  title: "Remark",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Remark',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Trip Image'.tr,
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
                    controller.uploadInvoice();
                  },
                  bgColor: ColorsValue.textFieldBg,
                  svgPicture: AssetConstants.ic_export,
                ),
                if (controller.selectImage != null) ...[
                  InkWell(
                    onTap: () {
                      RouteManagement.goToShowFullScareenImage(
                        controller.selectImage,
                        "Image",
                      );
                    },
                    child: Image.network(
                      controller.selectImage ?? "",
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
                Dimens.boxHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Participants", style: Styles.txtBlackColorW70018),
                    CustomButton(
                      backgroundColor: ColorsValue.appColor,
                      heightBtn: Dimens.twentySeven,
                      widthBtn: Dimens.fourtyThree,
                      onPressed: () {
                        controller.participantsList.add(
                          ParticipantsModel(selectMember: null),
                        );
                        controller.update();
                      },
                      text: 'Add',
                      textStyle: Styles.whiteColorW50012,
                      radius: Dimens.four,
                    ),
                  ],
                ),
                Dimens.boxHeight10,
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.participantsList.length,
                  itemBuilder: (context, index) {
                    var item = controller.participantsList[index];
                    return Padding(
                      padding: Dimens.edgeInsetsBottom10,
                      child: Row(
                        spacing: Dimens.ten,
                        children: [
                          Expanded(
                            child: Container(
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
                              child: DropdownButton<String>(
                                underline: Container(),
                                isDense: true,
                                isExpanded: true,
                                onChanged: (value) {
                                  item.selectMember = value;
                                  controller.update();
                                },
                                hint: Text(
                                  'Select Relation'.tr,
                                  style: Styles.txtGreyColorW50012.copyWith(
                                    fontSize:
                                        Utility.isTablet()
                                            ? Dimens.eighteen
                                            : Dimens.fourteen,
                                  ),
                                ),
                                focusColor: Colors.white,
                                dropdownColor: ColorsValue.whiteColor,
                                value:
                                    item.selectMember?.isNotEmpty ?? false
                                        ? item.selectMember
                                        : null,
                                style: Styles.txtBlackColorW50014,
                                iconEnabledColor: Colors.black,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: Dimens.twenty,
                                ),
                                items:
                                    controller.userDataList.isNotEmpty
                                        ? controller.userDataList.map((option) {
                                          return DropdownMenuItem(
                                            value: option.id,
                                            child: Text(
                                              option.name ?? "",
                                              style: Styles.txtBlackColorW50014
                                                  .copyWith(
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
                          ),
                          Container(
                            height: Dimens.fifty,
                            width: Dimens.fifty,
                            decoration: BoxDecoration(
                              color: ColorsValue.textFieldBg,
                              borderRadius: BorderRadius.circular(Dimens.ten),
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(AssetConstants.ic_delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
