import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class SalesAnalyticsListScreen extends StatelessWidget {
  const SalesAnalyticsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) async {
        var controller = Get.find<SalesAnalyticsController>();
        controller.customerPagingController = PagingController(firstPageKey: 1);
        controller.customerPagingController.addPageRequestListener((
          pageKey,
        ) async {
          await controller.postSalesList(pageKey);
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
          floatingActionButton: Column(
            spacing: Dimens.ten,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  RouteManagement.goToSalesAnalyticsScreen();
                },
                child: Container(
                  height: Dimens.fourtyFive,
                  width: Dimens.ninty,
                  decoration: BoxDecoration(
                    color: ColorsValue.appColor,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: Row(
                    spacing: Dimens.ten,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: ColorsValue.whiteColor,
                        size: Dimens.twentyFour,
                      ),
                      Text("New", style: Styles.whiteColorW60014),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  RouteManagement.goToAddOldCustomerScreen();
                },
                child: Container(
                  height: Dimens.fourtyFive,
                  width: Dimens.ninty,
                  decoration: BoxDecoration(
                    color: ColorsValue.appColor,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: Row(
                    spacing: Dimens.ten,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: ColorsValue.whiteColor,
                        size: Dimens.twentyFour,
                      ),
                      Text("Old", style: Styles.whiteColorW60014),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // floatingActionButton: GestureDetector(
          //   onTap: () {
          //     RouteManagement.goToSalesAnalyticsScreen();
          //   },
          //   child: Container(
          //     height: Utility.isTablet() ? Dimens.eighty : Dimens.sixty,
          //     width: Utility.isTablet() ? Dimens.eighty : Dimens.sixty,
          //     decoration: BoxDecoration(
          //       color: ColorsValue.appColor,
          //       borderRadius: BorderRadius.circular(Dimens.fiveHundred),
          //     ),
          //     child: Icon(
          //       Icons.add,
          //       color: ColorsValue.whiteColor,
          //       size: Dimens.thirty,
          //     ),
          //   ),
          // ),
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
                                      height: Get.height * 0.80,
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
                                                            Dimens.eighteen,
                                                      ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: SvgPicture.asset(
                                                    AssetConstants.ic_close,
                                                    height: Dimens.twentyFour,
                                                    width: Dimens.twentyFour,
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
                                                            controller.filterInterType.asMap().entries.map((
                                                              e,
                                                            ) {
                                                              var index = e.key;
                                                              return InkWell(
                                                                onTap: () {
                                                                  controller
                                                                          .filterInterValue =
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
                                                                        Dimens
                                                                            .thirtySix,
                                                                    width:
                                                                        double
                                                                            .maxFinite,
                                                                    decoration: BoxDecoration(
                                                                      color:
                                                                          controller.filterInterValue ==
                                                                                  index
                                                                              ? ColorsValue.greyColor
                                                                              : Colors.transparent,
                                                                    ),
                                                                    child: Text(
                                                                      controller
                                                                          .filterInterType[index],
                                                                      style: Styles
                                                                          .txtBlackColorW70016
                                                                          .copyWith(
                                                                            fontSize:
                                                                                Dimens.sixteen,
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
                                                            .filterInterValue) {
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
                                                                              Dimens.fourteen,
                                                                        ),
                                                                    hintStyle: Styles
                                                                        .txtGreyColorW50012
                                                                        .copyWith(
                                                                          fontSize:
                                                                              Dimens.twelve,
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
                                                                          controller.fromOnboardDate =
                                                                              null;
                                                                          controller
                                                                              .fromOnboardDate = await showDatePicker(
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
                                                                          if (controller.fromOnboardDate !=
                                                                              null) {
                                                                            controller.fromOnboardController.text = DateFormat(
                                                                              "yyyy-MM-dd",
                                                                            ).format(
                                                                              controller.fromOnboardDate ??
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
                                                                            .toOnboardController,
                                                                    isTitle:
                                                                        true,
                                                                    readOnly:
                                                                        true,
                                                                    titleStyle: Styles
                                                                        .txtBlackColorW70014
                                                                        .copyWith(
                                                                          fontSize:
                                                                              Dimens.fourteen,
                                                                        ),
                                                                    hintStyle: Styles
                                                                        .txtGreyColorW50012
                                                                        .copyWith(
                                                                          fontSize:
                                                                              Dimens.twelve,
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
                                                                          controller.toOnboardDate =
                                                                              null;
                                                                          controller
                                                                              .toOnboardDate = await showDatePicker(
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
                                                                          if (controller.toOnboardDate !=
                                                                              null) {
                                                                            controller.toOnboardController.text = DateFormat(
                                                                              "yyyy-MM-dd",
                                                                            ).format(
                                                                              controller.toOnboardDate ??
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
                                                          controller
                                                              .toOnboardController
                                                              .clear();
                                                          controller
                                                              .fromOnboardController
                                                              .clear();
                                                          controller
                                                              .filterInterValue = 0;
                                                          controller.update();
                                                          controller
                                                              .customerPagingController
                                                              .refresh();
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: Dimens.fifty,
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
                                                                      Dimens
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
                                                          controller
                                                              .customerPagingController
                                                              .refresh();
                                                          controller.update();
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: Dimens.fifty,
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
                                                                      Dimens
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
                  child: RefreshIndicator(
                    onRefresh:
                        () => Future.sync(
                          () => controller.customerPagingController.refresh(),
                        ),
                    child: PagedListView<int, SalesListDoc>(
                      pagingController: controller.customerPagingController,
                      builderDelegate: PagedChildBuilderDelegate<SalesListDoc>(
                        noItemsFoundIndicatorBuilder: (context) {
                          return Center(
                            child: Text(
                              "Sales Analytics data not found...!",
                              style: Styles.txtBlackColorW50014,
                            ),
                          );
                        },
                        itemBuilder: (context, item, index) {
                          return CustomerCard(element: item);
                        },
                      ),
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

class CustomerCard extends StatelessWidget {
  final SalesListDoc element;

  const CustomerCard({super.key, required this.element});

  Color getStatusColor() {
    switch (element.status.toString().toLowerCase()) {
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
    String? nextdateStr = element.nextdate;

    DateTime? parsed;

    if (nextdateStr != null && nextdateStr.isNotEmpty) {
      try {
        parsed = DateTime.parse(nextdateStr);
      } catch (e) {
        parsed = null;
      }
    }

    final nextDate =
        parsed != null ? DateFormat("yyyy-MM-dd").format(parsed) : "";

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
                Expanded(
                  child: Text(
                    element.customer?.name ?? '',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (element.status?.isNotEmpty ??
                    false || element.status != null)
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
                      element.status ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            Dimens.boxHeight6,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dimens.boxHeight0,
                    if ((element.customer?.mobile?.isNotEmpty ?? false) ||
                        element.customer?.mobile != "")
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Mobile Number :- ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: element.customer?.mobile ?? '',
                              style: const TextStyle(
                                color: Color(0xFF748CA0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if ((nextDate.isNotEmpty) || nextDate != "")
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Next Date :- ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: nextDate,
                              style: const TextStyle(
                                color: Color(0xFF748CA0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9B787),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        element.attempt != null
                            ? "ATT:- ${element.attempt}"
                            : "ATT:- 0",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
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
