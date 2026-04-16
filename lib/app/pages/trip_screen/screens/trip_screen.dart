import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<TripController>(
      initState: (state) {
        final controller = Get.find<TripController>();
        controller.tripPagingController = PagingController(firstPageKey: 1);
        controller.tripPagingController.addPageRequestListener((pageKey) async {
          await controller.postGetAllTripList(pageKey);
        });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Trip",
            isCenter: true,
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              RouteManagement.goToAddTripScreen();
            },
            child: Container(
              height: Utility.isTablet() ? Dimens.eighty : Dimens.sixty,
              width: Utility.isTablet() ? Dimens.eighty : Dimens.sixty,
              decoration: BoxDecoration(
                color: ColorsValue.appColor,
                borderRadius: BorderRadius.circular(Dimens.fiveHundred),
              ),
              child: Icon(
                Icons.add,
                color: ColorsValue.whiteColor,
                size: Dimens.thirty,
              ),
            ),
          ),
          body: Padding(
            padding: Dimens.edgeInsets20_10_20_20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: Dimens.ten,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.searchController,
                        isTitle: false,
                        titleStyle: Styles.txtBlackColorW70014.copyWith(
                          fontSize:
                              Utility.isTablet()
                                  ? Dimens.twenty
                                  : Dimens.fourteen,
                        ),
                        hintStyle: Styles.txtGreyColorW50012.copyWith(
                          fontSize:
                              Utility.isTablet()
                                  ? Dimens.eighteen
                                  : Dimens.fourteen,
                        ),
                        hintText: 'Search'.tr,
                        fillColor: ColorsValue.textFieldBg,
                        filled: true,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _debouncer.run(() {
                            Future.sync(() {
                              return controller.tripPagingController.refresh();
                            });
                          });
                        },
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          constraints: BoxConstraints(
                            maxWidth: double.maxFinite,
                          ),
                          builder:
                              (context) => StatefulBuilder(
                                builder:
                                    (context, setState) => Container(
                                      height:
                                          Utility.isTablet()
                                              ? Get.height * 0.72
                                              : Get.height * 0.80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            Dimens.twenty,
                                          ),
                                          topRight: Radius.circular(
                                            Dimens.twenty,
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                Dimens.edgeInsets20_20_20_00,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Filter'.tr,
                                                  style: Styles
                                                      .txtBlackColorW70018
                                                      .copyWith(
                                                        fontSize:
                                                            Utility.isTablet()
                                                                ? Dimens
                                                                    .twentyFour
                                                                : Dimens
                                                                    .eighteen,
                                                      ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: SvgPicture.asset(
                                                    AssetConstants.ic_close,
                                                    height:
                                                        Utility.isTablet()
                                                            ? Dimens.thirty
                                                            : Dimens.twentyFour,
                                                    width:
                                                        Utility.isTablet()
                                                            ? Dimens.thirty
                                                            : Dimens.twentyFour,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                          ColorsValue
                                                              .txtBlackColor,
                                                          BlendMode.srcIn,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Dimens.boxHeight12,
                                          Divider(
                                            height: Dimens.one,
                                            color: ColorsValue.greyAAA,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      padding:
                                                          Dimens
                                                              .edgeInsetsTop10,
                                                      height:
                                                          MediaQuery.of(
                                                            context,
                                                          ).size.height *
                                                          0.60,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            ColorsValue
                                                                .textFieldBg,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                              topRight:
                                                                  Radius.circular(
                                                                    Dimens.six,
                                                                  ),
                                                              bottomRight:
                                                                  Radius.circular(
                                                                    Dimens.six,
                                                                  ),
                                                            ),
                                                      ),
                                                      child: Wrap(
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        children:
                                                            controller.filterType.asMap().entries.map((
                                                              e,
                                                            ) {
                                                              var index = e.key;
                                                              return InkWell(
                                                                onTap: () {
                                                                  controller
                                                                          .filterValue =
                                                                      index;
                                                                  setState(
                                                                    () {},
                                                                  );
                                                                },
                                                                child: Padding(
                                                                  padding:
                                                                      Dimens
                                                                          .edgeInsetsBottom10,
                                                                  child: Container(
                                                                    padding:
                                                                        Dimens
                                                                            .edgeInsetsLeft20,
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    height:
                                                                        Utility.isTablet()
                                                                            ? Dimens.fiftyFive
                                                                            : Dimens.thirtySix,
                                                                    width:
                                                                        double
                                                                            .maxFinite,
                                                                    decoration: BoxDecoration(
                                                                      color:
                                                                          controller.filterValue ==
                                                                                  index
                                                                              ? ColorsValue.greyColor
                                                                              : Colors.transparent,
                                                                    ),
                                                                    child: Text(
                                                                      controller
                                                                          .filterType[index],
                                                                      style: Styles.txtBlackColorW70016.copyWith(
                                                                        fontSize:
                                                                            Utility.isTablet()
                                                                                ? Dimens.twenty
                                                                                : Dimens.sixteen,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 8,
                                                    child: ListView.builder(
                                                      itemCount: 1,
                                                      shrinkWrap: true,
                                                      padding: EdgeInsets.zero,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemBuilder: (
                                                        context,
                                                        index,
                                                      ) {
                                                        switch (controller
                                                            .filterValue) {
                                                          case 0:
                                                            return Padding(
                                                              padding:
                                                                  Dimens
                                                                      .edgeInsets16,
                                                              child: Column(
                                                                children: [
                                                                  CustomTextFormField(
                                                                    controller:
                                                                        controller
                                                                            .fromCandidateController,
                                                                    isTitle:
                                                                        true,
                                                                    readOnly:
                                                                        true,
                                                                    titleStyle: Styles
                                                                        .txtBlackColorW70014
                                                                        .copyWith(
                                                                          fontSize:
                                                                              Utility.isTablet()
                                                                                  ? Dimens.twenty
                                                                                  : Dimens.fourteen,
                                                                        ),
                                                                    hintStyle: Styles
                                                                        .txtGreyColorW50012
                                                                        .copyWith(
                                                                          fontSize:
                                                                              Utility.isTablet()
                                                                                  ? Dimens.eighteen
                                                                                  : Dimens.twelve,
                                                                        ),
                                                                    hintText:
                                                                        'From Date'
                                                                            .tr,
                                                                    title:
                                                                        'From Date'
                                                                            .tr,
                                                                    fillColor:
                                                                        ColorsValue
                                                                            .textFieldBg,
                                                                    filled:
                                                                        true,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .phone,
                                                                    suffixIcon: Padding(
                                                                      padding:
                                                                          Dimens
                                                                              .edgeInsets8,
                                                                      child: GestureDetector(
                                                                        onTap: () async {
                                                                          controller.fromDate =
                                                                              null;
                                                                          controller
                                                                              .fromDate = await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                controller.fromDate,
                                                                            firstDate: DateTime(
                                                                              1920,
                                                                            ),
                                                                            lastDate: DateTime(
                                                                              2100,
                                                                            ),
                                                                            initialEntryMode:
                                                                                DatePickerEntryMode.calendarOnly,
                                                                          );
                                                                          if (controller.fromDate !=
                                                                              null) {
                                                                            controller.fromCandidateController.text = DateFormat(
                                                                              "yyyy-MM",
                                                                            ).format(
                                                                              controller.fromDate ??
                                                                                  DateTime.now(),
                                                                            );
                                                                            setState(
                                                                              () {},
                                                                            );
                                                                          }
                                                                        },
                                                                        child: SvgPicture.asset(
                                                                          AssetConstants
                                                                              .ic_date,
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    validator: (
                                                                      val,
                                                                    ) {
                                                                      if (val!
                                                                          .isEmpty) {
                                                                        return 'Select From Date'
                                                                            .tr;
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  Dimens
                                                                      .boxHeight20,
                                                                  CustomTextFormField(
                                                                    controller:
                                                                        controller
                                                                            .toCandidateController,
                                                                    isTitle:
                                                                        true,
                                                                    readOnly:
                                                                        true,
                                                                    titleStyle: Styles
                                                                        .txtBlackColorW70014
                                                                        .copyWith(
                                                                          fontSize:
                                                                              Utility.isTablet()
                                                                                  ? Dimens.twenty
                                                                                  : Dimens.fourteen,
                                                                        ),
                                                                    hintStyle: Styles
                                                                        .txtGreyColorW50012
                                                                        .copyWith(
                                                                          fontSize:
                                                                              Utility.isTablet()
                                                                                  ? Dimens.eighteen
                                                                                  : Dimens.twelve,
                                                                        ),
                                                                    hintText:
                                                                        'To Date'
                                                                            .tr,
                                                                    title:
                                                                        'To Date'
                                                                            .tr,
                                                                    fillColor:
                                                                        ColorsValue
                                                                            .textFieldBg,
                                                                    filled:
                                                                        true,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .phone,
                                                                    suffixIcon: Padding(
                                                                      padding:
                                                                          Dimens
                                                                              .edgeInsets8,
                                                                      child: GestureDetector(
                                                                        onTap: () async {
                                                                          controller.toDate =
                                                                              null;
                                                                          controller
                                                                              .toDate = await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                controller.toDate,
                                                                            firstDate: DateTime(
                                                                              1920,
                                                                            ),
                                                                            lastDate: DateTime(
                                                                              2100,
                                                                            ),
                                                                            initialEntryMode:
                                                                                DatePickerEntryMode.calendarOnly,
                                                                          );
                                                                          if (controller.toDate !=
                                                                              null) {
                                                                            controller.toCandidateController.text = DateFormat(
                                                                              "yyyy-MM",
                                                                            ).format(
                                                                              controller.toDate ??
                                                                                  DateTime.now(),
                                                                            );
                                                                            setState(
                                                                              () {},
                                                                            );
                                                                          }
                                                                        },
                                                                        child: SvgPicture.asset(
                                                                          AssetConstants
                                                                              .ic_date,
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    validator: (
                                                                      val,
                                                                    ) {
                                                                      if (val!
                                                                          .isEmpty) {
                                                                        return 'Select From Date'
                                                                            .tr;
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          case 1:
                                                            return SizedBox(
                                                              height:
                                                                  Utility.isTablet()
                                                                      ? Get.height /
                                                                          2
                                                                      : Get.height /
                                                                          1.6,
                                                              child: Padding(
                                                                padding:
                                                                    Dimens
                                                                        .edgeInsets16,
                                                                child: RadioGroup<
                                                                  String
                                                                >(
                                                                  groupValue:
                                                                      controller
                                                                          .radioStatus,
                                                                  onChanged: (
                                                                    String?
                                                                    value,
                                                                  ) {
                                                                    setState(() {
                                                                      controller
                                                                              .radioStatus =
                                                                          value!;
                                                                    });
                                                                  },
                                                                  child: Column(
                                                                    children: [
                                                                      RadioListTile<
                                                                        String
                                                                      >(
                                                                        contentPadding:
                                                                            Dimens.edgeInsets0,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        title: Text(
                                                                          "Pending",
                                                                          style:
                                                                              Styles.txtBlackColorW40014,
                                                                        ),

                                                                        value:
                                                                            "Pending",
                                                                      ),
                                                                      RadioListTile<
                                                                        String
                                                                      >(
                                                                        contentPadding:
                                                                            Dimens.edgeInsets0,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        title: Text(
                                                                          "Ongoing",
                                                                          style:
                                                                              Styles.txtBlackColorW40014,
                                                                        ),
                                                                        value:
                                                                            "Ongoing",
                                                                      ),
                                                                      RadioListTile<
                                                                        String
                                                                      >(
                                                                        contentPadding:
                                                                            Dimens.edgeInsets0,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        title: Text(
                                                                          "Completed",
                                                                          style:
                                                                              Styles.txtBlackColorW40014,
                                                                        ),
                                                                        value:
                                                                            "Completed",
                                                                      ),
                                                                      RadioListTile<
                                                                        String
                                                                      >(
                                                                        contentPadding:
                                                                            Dimens.edgeInsets0,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        title: Text(
                                                                          "Cancelled",
                                                                          style:
                                                                              Styles.txtBlackColorW40014,
                                                                        ),
                                                                        value:
                                                                            "Cancelled",
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                height: 1,
                                                color: ColorsValue.greyAAA,
                                              ),
                                              Dimens.boxHeight10,
                                              Padding(
                                                padding:
                                                    Dimens
                                                        .edgeInsets20_00_20_00,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () async {
                                                          Utility.isFilter =
                                                              false;
                                                          controller
                                                              .toCandidateController
                                                              .clear();
                                                          controller
                                                              .fromCandidateController
                                                              .clear();
                                                          controller
                                                                  .radioStatus =
                                                              "Pending";

                                                          controller
                                                              .filterValue = 0;

                                                          controller.update();
                                                          controller
                                                              .tripPagingController
                                                              .refresh();
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height:
                                                              Utility.isTablet()
                                                                  ? Dimens
                                                                      .fiftyFive
                                                                  : Dimens
                                                                      .fifty,
                                                          width:
                                                              double.maxFinite,
                                                          decoration: BoxDecoration(
                                                            color:
                                                                ColorsValue
                                                                    .whiteColor,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  Dimens.ten,
                                                                ),
                                                            border: Border.all(
                                                              color:
                                                                  ColorsValue
                                                                      .appColor,
                                                              width: Dimens.one,
                                                            ),
                                                          ),
                                                          child: Text(
                                                            'Clear Filter'.tr,
                                                            style: Styles
                                                                .txtBlackColorW50014
                                                                .copyWith(
                                                                  fontSize:
                                                                      Utility.isTablet()
                                                                          ? Dimens
                                                                              .twenty
                                                                          : Dimens
                                                                              .fourteen,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Dimens.boxWidth20,
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () async {
                                                          Get.back();
                                                          Utility.isFilter =
                                                              true;
                                                          controller
                                                              .tripPagingController
                                                              .refresh();
                                                          controller.update();
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height:
                                                              Utility.isTablet()
                                                                  ? Dimens
                                                                      .fiftyFive
                                                                  : Dimens
                                                                      .fifty,
                                                          width:
                                                              double.maxFinite,
                                                          decoration: BoxDecoration(
                                                            color:
                                                                ColorsValue
                                                                    .appColor,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  Dimens.ten,
                                                                ),
                                                          ),
                                                          child: Text(
                                                            'Apply'.tr,
                                                            style: Styles
                                                                .whiteColorW50014
                                                                .copyWith(
                                                                  fontSize:
                                                                      Utility.isTablet()
                                                                          ? Dimens
                                                                              .twenty
                                                                          : Dimens
                                                                              .fourteen,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                              ),
                        );
                      },
                      child: Container(
                        height: Dimens.fourtyFive,
                        width: Dimens.fourtyFive,
                        padding:
                            Utility.isTablet()
                                ? Dimens.edgeInsets30_10_30_10
                                : Dimens.edgeInsets14_06_14_06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          color: ColorsValue.greyColor,
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.txtBlackColor,
                          ),
                        ),
                        child: SvgPicture.asset(
                          AssetConstants.ic_filter,
                          height:
                              Utility.isTablet()
                                  ? Dimens.twentyFour
                                  : Dimens.twenty,
                          width:
                              Utility.isTablet()
                                  ? Dimens.twentyFour
                                  : Dimens.twenty,
                        ),
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight20,
                Expanded(
                  child: PagedListView<int, GetAllTripDoc>(
                    pagingController: controller.tripPagingController,
                    builderDelegate: PagedChildBuilderDelegate<GetAllTripDoc>(
                      noItemsFoundIndicatorBuilder: (context) {
                        return Center(
                          child: Text(
                            "Trip data not found..!",
                            style: Styles.txtBlackColorW50016,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      itemBuilder: (context, item, index) {
                        return GestureDetector(
                          onTap: () {
                            RouteManagement.goToTripDetailsScreen(
                              tripid: item.id ?? "",
                            );
                          },
                          child: Container(
                            margin: Dimens.edgeInsetsBottom10,
                            decoration: BoxDecoration(
                              color: ColorsValue.textFieldBg,
                            ),
                            padding: Dimens.edgeInsets14,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.tripname ?? "",
                                      style: Styles.txtBlackColorW70014
                                          .copyWith(fontSize: Dimens.sixteen),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: Dimens.edgeInsets06_04_06_04,
                                      decoration: BoxDecoration(
                                        color:
                                            item.status == "Completed"
                                                ? ColorsValue.greenColor
                                                : item.status == "Cancelled"
                                                ? ColorsValue.redColor
                                                : ColorsValue.appColor,
                                        borderRadius: BorderRadius.circular(
                                          Dimens.four,
                                        ),
                                      ),
                                      child: Text(
                                        item.status?.capitalizeFirst ?? "",
                                        style: Styles.whiteColorW50010,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight6,
                                Row(
                                  children: [
                                    Text(
                                      "Purpose :- ",
                                      style: Styles.txtBlackColorW50014,
                                    ),
                                    Text(
                                      item.purpose ?? "",
                                      style: Styles.txtGreyColorW40014,
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight6,
                                Row(
                                  children: [
                                    Text(
                                      "Date :-  ",
                                      style: Styles.txtBlackColorW50014,
                                    ),
                                    Text(
                                      Utility.getFormatedTime(
                                        item.start.toString(),
                                        'dd-MM-yyyy',
                                      ),
                                      style: Styles.txtGreyColorW40014,
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight6,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Location :-  ",
                                      style: Styles.txtBlackColorW50014,
                                    ),
                                    Flexible(
                                      child: Text(
                                        item.location ?? "",
                                        style: Styles.txtGreyColorW40014,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
