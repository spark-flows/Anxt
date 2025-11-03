import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/models/getAllUsers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SalesAnalyticsListScreen extends StatelessWidget {
  const SalesAnalyticsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) {
        var controller = Get.find<SalesAnalyticsController>();
        controller.postAllUserList(1);
        controller.scrollController.addListener(() async {
          if (controller.scrollController.position.pixels ==
              controller.scrollController.position.maxScrollExtent) {
            if (controller.isLoading == false) {
              controller.isLoading = true;
              controller.update();
              if (controller.isLastPage == false) {
                await controller.postAllUserList(controller.pageCount);
              }
              controller.isLoading = false;
              controller.update();
            }
          }
        });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "All Customer Details",
            isCenter: true,
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              RouteManagement.goToSalesAnalyticsScreen();
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                                                            controller.filterOnboardType.asMap().entries.map((
                                                              e,
                                                            ) {
                                                              var index = e.key;
                                                              return InkWell(
                                                                onTap: () {
                                                                  controller
                                                                          .filterOnboardValue =
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
                                                                          controller.filterOnboardValue ==
                                                                                  index
                                                                              ? ColorsValue.greyColor
                                                                              : Colors.transparent,
                                                                    ),
                                                                    child: Text(
                                                                      controller
                                                                          .filterOnboardType[index],
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
                                                            .filterOnboardValue) {
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
                                                                            .fromOnboardController,
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
                                                                          final DateTime?
                                                                          picked = await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                controller.fromOnboardDate,
                                                                            firstDate: DateTime(
                                                                              1920,
                                                                            ),
                                                                            lastDate: DateTime(
                                                                              2100,
                                                                            ),
                                                                            initialEntryMode:
                                                                                DatePickerEntryMode.calendarOnly,
                                                                          );
                                                                          if (picked !=
                                                                                  null &&
                                                                              picked !=
                                                                                  controller.fromOnboardDate) {
                                                                            controller.fromOnboardDate =
                                                                                picked;
                                                                            controller.fromOnboardController.text = DateFormat(
                                                                              "yyyy-MM-dd",
                                                                            ).format(
                                                                              controller.fromOnboardDate,
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
                                                                            .toOnboardController,
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
                                                                          final DateTime?
                                                                          picked = await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                controller.toOnboardDate,
                                                                            firstDate: DateTime(
                                                                              1920,
                                                                            ),
                                                                            lastDate: DateTime(
                                                                              2100,
                                                                            ),
                                                                            initialEntryMode:
                                                                                DatePickerEntryMode.calendarOnly,
                                                                          );
                                                                          if (picked !=
                                                                                  null &&
                                                                              picked !=
                                                                                  controller.toOnboardDate) {
                                                                            controller.toOnboardDate =
                                                                                picked;
                                                                            controller.toOnboardController.text = DateFormat(
                                                                              "yyyy-MM-dd",
                                                                            ).format(
                                                                              controller.toOnboardDate,
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
                                                              .toOnboardController
                                                              .clear();
                                                          controller
                                                              .fromOnboardController
                                                              .clear();

                                                          controller
                                                              .filterOnboardValue = 0;
                                                          controller.update();
                                                          // controller
                                                          //     .customersProPagingController
                                                          //     .refresh();
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
                                                          // controller
                                                          //     .customersProPagingController
                                                          //     .refresh();
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
                        height: Dimens.thirty,
                        width: Dimens.ninty,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          color: ColorsValue.greyColor,
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.txtBlackColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Filter", style: Styles.txtBlackColorW50014),
                            Dimens.boxWidth10,
                            SvgPicture.asset(
                              AssetConstants.ic_filter,
                              height:
                                  Utility.isTablet()
                                      ? Dimens.twentyFour
                                      : Dimens.fifteen,
                              width:
                                  Utility.isTablet()
                                      ? Dimens.twentyFour
                                      : Dimens.fifteen,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight20,
                Expanded(
                  child:
                      !controller.isLoading
                          ? ListView.builder(
                            itemCount: controller.getAllUserList.length,
                            itemBuilder: (context, index) {
                              final element = controller.getAllUserList[index];
                              return CustomerCard(element: element);
                              // return GestureDetector(
                              //   onTap: () {
                              //     RouteManagement.goToSalesAnalyticsDetailsScreen(element.id);
                              //   },
                              //   child: Container(
                              //     color: ColorsValue.textFieldBg,
                              //     padding: Dimens.edgeInsets20_00_20_10,
                              //     margin: Dimens.edgeInsetsBottom10,
                              //     child: Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         ListTile(
                              //           dense: true,
                              //           visualDensity: VisualDensity(vertical: Dimens.zero, horizontal: Dimens.zero),
                              //           contentPadding: Dimens.edgeInsets0,
                              //           minVerticalPadding: Dimens.zero,
                              //           title: Row(
                              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //             children: [
                              //               Text(element.name ?? "Sagar Miyani", style: Styles.txtBlackColorW70018),
                              //               Container(
                              //                 padding: Dimens.edgeInsets06_04_06_04,
                              //                 decoration: BoxDecoration(
                              //                   color: ColorsValue.appColorEBBD87,
                              //                   borderRadius: BorderRadius.circular(Dimens.four),
                              //                 ),
                              //                 child: Text(element.status.toString(), style: Styles.whiteColorW50010),
                              //               ),
                              //             ],
                              //           ),
                              //           subtitle: Padding(
                              //             padding: Dimens.edgeInsetsTop05,
                              //             child: Row(
                              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //               children: [
                              //                 Row(
                              //                   crossAxisAlignment: CrossAxisAlignment.start,
                              //                   children: [
                              //                     Text("Mobile Number :- ", style: Styles.txtBlackColorW60014),
                              //                     Text(
                              //                       element.mobile ?? " - ",
                              //                       style: Styles.txtBlackColorW40014,
                              //                     ),
                              //                   ],
                              //                 ),
                              //                 Container(
                              //                   padding: Dimens.edgeInsets06_04_06_04,
                              //                   decoration: BoxDecoration(
                              //                     color: ColorsValue.appColor,
                              //                     borderRadius: BorderRadius.circular(Dimens.four),
                              //                   ),
                              //                   child: Text("ATT :- 12", style: Styles.whiteColorW50010),
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // );
                            },
                          )
                          : Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomerCard extends StatelessWidget {
  final GetAllUsesDoc element;

  const CustomerCard({super.key, required this.element});

  Color getStatusColor() {
    switch (element.pilistatus.toString().toLowerCase()) {
      case 'pending':
        return const Color(0xFFE8C08C);
      case 'pipeline':
        return const Color(0xFF9CC4F5);
      case 'cancel':
        return const Color(0xFFE57373);
      case 'processing':
        return const Color(0xFFB39DDB);
      case 'sale':
        return const Color(0xFF81C784);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteManagement.goToSalesAnalyticsDetailsScreen(
          salesid: element.id ?? '',
        );
      },
      child: Container(
        margin: Dimens.edgeInsets0.copyWith(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  element.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                if (element.pilistatus?.isNotEmpty ??
                    false || element.pilistatus != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: getStatusColor(),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      element.pilistatus ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            if ((element.mobile?.isNotEmpty ?? false) || element.mobile != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Mobile Number :- ",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        element.mobile ?? '',
                        style: const TextStyle(
                          color: Color(0xFF748CA0),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9B787),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "ATT:- ${element.attempt}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
