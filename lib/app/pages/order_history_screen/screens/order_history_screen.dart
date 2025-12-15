import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<OrderHistoryController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.textFieldBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'OrderHistoryScreen'.tr,
            isCenter: true,
            bgColor: ColorsValue.textFieldBg,
          ),
          body: SafeArea(
            child: Padding(
              padding: Dimens.edgeInsets20_10_20_20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: Dimens.ten,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: controller.searchController,
                          isTitle: false,
                          titleStyle: Styles.txtBlackColorW70014.copyWith(
                            fontSize: Dimens.fourteen,
                          ),
                          hintStyle: Styles.txtGreyColorW50012.copyWith(
                            fontSize: Dimens.fourteen,
                          ),
                          hintText: 'Search'.tr,
                          fillColor: ColorsValue.whiteColor,
                          filled: true,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            _debouncer.run(() {
                              Future.sync(() {
                                // return controller.customersProPagingController
                                //     .refresh();
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                      Dimens
                                                                          .six,
                                                                    ),
                                                                bottomRight:
                                                                    Radius.circular(
                                                                      Dimens
                                                                          .six,
                                                                    ),
                                                              ),
                                                        ),
                                                        child: Wrap(
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          children:
                                                              controller.filterInterType.asMap().entries.map((
                                                                e,
                                                              ) {
                                                                var index =
                                                                    e.key;
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
                                                                        style: Styles.txtBlackColorW70016.copyWith(
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
                                                        padding:
                                                            EdgeInsets.zero,
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
                                                                              .selectDateController,
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
                                                                            Dimens.edgeInsets8,
                                                                        child: GestureDetector(
                                                                          onTap: () async {
                                                                            final DateTime?
                                                                            picked = await showDatePicker(
                                                                              context:
                                                                                  context,
                                                                              initialDate:
                                                                                  controller.fromInterDate,
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
                                                                                    controller.fromInterDate) {
                                                                              controller.fromInterDate = picked;
                                                                              controller.selectDateController.text = DateFormat(
                                                                                "yyyy-MM-dd",
                                                                              ).format(
                                                                                controller.fromInterDate,
                                                                              );
                                                                              setState(
                                                                                () {},
                                                                              );
                                                                            }
                                                                          },
                                                                          child: SvgPicture.asset(
                                                                            AssetConstants.ic_date,
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
                                                                .selectDateController
                                                                .clear();
                                                            controller
                                                                .filterInterValue = 0;

                                                            controller.update();
                                                            // controller
                                                            //     .attendancePagingController
                                                            //     .refresh();
                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            alignment:
                                                                Alignment
                                                                    .center,
                                                            height:
                                                                Dimens.fifty,
                                                            width:
                                                                double
                                                                    .maxFinite,
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
                                                                width:
                                                                    Dimens.one,
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
                                                            // controller
                                                            //     .attendancePagingController
                                                            //     .refresh();
                                                            controller.update();
                                                          },
                                                          child: Container(
                                                            alignment:
                                                                Alignment
                                                                    .center,
                                                            height:
                                                                Dimens.fifty,
                                                            width:
                                                                double
                                                                    .maxFinite,
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
                          height: Dimens.fifty,
                          width: Dimens.fifty,
                          padding: Dimens.edgeInsets14_06_14_06,
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
                            height: Dimens.twenty,
                            width: Dimens.twenty,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight10,
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            RouteManagement.goToOrderHistoryDetailsScreen();
                          },
                          child: Container(
                            margin: Dimens.edgeInsetsBottom10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimens.ten),
                              color: ColorsValue.whiteColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: Dimens.edgeInsets10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Sagar Miyani",
                                            style: Styles.txtBlackColorW70016,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                AssetConstants.ic_date,
                                                height: Dimens.twenty,
                                                width: Dimens.twenty,
                                                colorFilter: ColorFilter.mode(
                                                  ColorsValue.txtGreyColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              Dimens.boxWidth6,
                                              Text(
                                                "25-05-2025",
                                                style:
                                                    Styles.txtGreyColorW60014,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight6,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Order No. :- ",
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              Text(
                                                "py-166-2025",
                                                style:
                                                    Styles.txtGreyColorW60014,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Qty :- ",
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              Text(
                                                "15",
                                                style:
                                                    Styles.txtGreyColorW60014,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight6,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Total Amount :- ",
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              Text(
                                                "\$1100",
                                                style:
                                                    Styles.txtGreyColorW60014,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Due Amount :- ",
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              Text(
                                                "\$600",
                                                style:
                                                    Styles.txtGreyColorW60014,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight20,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Status :- ",
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              Container(
                                                padding:
                                                    Dimens
                                                        .edgeInsets08_04_08_04,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorsValue
                                                          .lightYellowColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        Dimens.four,
                                                      ),
                                                ),
                                                child: Text(
                                                  "Pending",
                                                  style:
                                                      Styles.yellowColorW70012,
                                                ),
                                              ),
                                            ],
                                          ),
                                          CustomButton(
                                            heightBtn: Dimens.thirtyTwo,
                                            widthBtn: Dimens.hundredFourty,
                                            onPressed: () {},
                                            text: "Get Invoice",
                                            textStyle:
                                                Styles.txtBlackColorW60014,
                                            isBorder: true,
                                            borderColor: ColorsValue.appColor,
                                            radius: Dimens.four,
                                            leading: SvgPicture.asset(
                                              AssetConstants.ic_download,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
