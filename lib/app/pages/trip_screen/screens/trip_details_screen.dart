import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart' show Participant;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TripController>(
      initState: (state) {
        final controller = Get.find<TripController>();
        controller.tripid = Get.arguments;
        controller.getOneTripData = null;
        controller.postGetOneTripDetail(tripId: controller.tripid ?? "");
        controller.postExpenseList();
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
          bottomNavigationBar:
              controller.getOneTripData != null
                  ? SafeArea(
                    child: Container(
                      margin: Dimens.edgeInsets20_00_20_10,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: Dimens.one,
                          color: ColorsValue.greyColor,
                        ),
                        color: ColorsValue.textFieldBg,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpansionTile(
                            tilePadding: Dimens.edgeInsets20_00_20_00,
                            childrenPadding: Dimens.edgeInsets20_00_20_00,
                            minTileHeight: Dimens.fourtyFive,
                            title: Text(
                              "Expanse Summary",
                              style: Styles.txtBlackColorW60014,
                            ),
                            shape: RoundedRectangleBorder(),
                            children: [
                              Divider(
                                height: Dimens.one,
                                color: ColorsValue.greyCBD5E1,
                              ),
                              Dimens.boxHeight10,
                              Wrap(
                                children:
                                    controller.categorySummaryList.map((e) {
                                      return Padding(
                                        padding: Dimens.edgeInsetsBottom10,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              spacing: Dimens.five,
                                              children: [
                                                Text(
                                                  e.name,
                                                  style:
                                                      Styles
                                                          .txtBlackColorW50014,
                                                ),
                                                Text(
                                                  "(${e.count} item)",
                                                  style:
                                                      Styles.txtGreyColorW50014,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "₹ ${e.total}",
                                              style: Styles.txtBlackColorW50014,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                              ),
                            ],
                          ),
                          DottedLine(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            lineLength: double.infinity,
                          ),
                          Dimens.boxHeight10,
                          Container(
                            height: Dimens.fourtyFive,
                            padding: Dimens.edgeInsets20_00_20_10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: Styles.txtBlackColorW60014,
                                ),
                                Text(
                                  "₹ ${controller.categorySummaryList.fold(0.0, (previousValue, element) => previousValue + element.total)}",
                                  style: Styles.txtBlackColorW60014,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
          body:
              controller.getOneTripData != null
                  ? ListView(
                    padding: Dimens.edgeInsets20_10_20_20,
                    physics: ClampingScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          RouteManagement.goToShowFullScareenImage(
                            controller.getOneTripData?.image ?? "",
                            "image",
                          );
                        },
                        child: Container(
                          height: Dimens.twoHundred,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.ten),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Dimens.ten),
                            child: CachedNetworkImage(
                              imageUrl: controller.getOneTripData?.image ?? "",
                              fit: BoxFit.cover,
                              height: Dimens.twoHundred,
                              width: double.maxFinite,
                              placeholder: (context, url) {
                                return Image.asset(
                                  AssetConstants.placeholder,
                                  fit: BoxFit.cover,
                                  height: Dimens.twoHundred,
                                  width: double.maxFinite,
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Image.asset(
                                  AssetConstants.placeholder,
                                  fit: BoxFit.cover,
                                  height: Dimens.twoHundred,
                                  width: double.maxFinite,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                      Container(
                        color: ColorsValue.textFieldBg,
                        padding: Dimens.edgeInsets14,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  spacing: Dimens.six,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Create Date",
                                      style: Styles.txtBlackColorW40012,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: Dimens.six,
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.ic_date,
                                          height: Dimens.twelve,
                                          width: Dimens.twelve,
                                        ),
                                        Text(
                                          Utility.getFormatedTime(
                                            controller.getOneTripData?.createdAt
                                                .toString(),
                                            'dd-MM-yyyy',
                                          ),
                                          style: Styles.txtBlackColorW60012,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: Dimens.six,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Status",
                                      style: Styles.txtBlackColorW40012,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: Dimens.edgeInsets06_02_06_02,
                                      decoration: BoxDecoration(
                                        color:
                                            controller.getOneTripData?.status ==
                                                    "completed"
                                                ? ColorsValue.greenColor
                                                : controller
                                                        .getOneTripData
                                                        ?.status ==
                                                    "cancelled"
                                                ? ColorsValue.redColor
                                                : ColorsValue.appColor,
                                        borderRadius: BorderRadius.circular(
                                          Dimens.four,
                                        ),
                                      ),
                                      child: Text(
                                        controller
                                                .getOneTripData
                                                ?.status
                                                ?.capitalizeFirst ??
                                            "",
                                        style: Styles.whiteColorW50010,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  spacing: Dimens.six,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Start Date",
                                      style: Styles.txtBlackColorW40012,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: Dimens.six,
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.ic_date,
                                          height: Dimens.twelve,
                                          width: Dimens.twelve,
                                        ),
                                        Text(
                                          Utility.getFormatedTime(
                                            controller.getOneTripData?.start
                                                .toString(),
                                            'dd-MM-yyyy',
                                          ),
                                          style: Styles.txtBlackColorW60012,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: Dimens.six,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "End Date",
                                      style: Styles.txtBlackColorW40012,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: Dimens.six,
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.ic_date,
                                          height: Dimens.twelve,
                                          width: Dimens.twelve,
                                        ),
                                        Text(
                                          Utility.getFormatedTime(
                                            controller.getOneTripData?.end
                                                .toString(),
                                            'dd-MM-yyyy',
                                          ),
                                          style: Styles.txtBlackColorW60012,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  spacing: Dimens.six,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "E. Budget",
                                      style: Styles.txtBlackColorW40012,
                                    ),
                                    Text(
                                      "₹ ${controller.getOneTripData?.budget.toString() ?? "0"}",
                                      style: Styles.txtBlackColorW60012,
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: Dimens.six,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Members",
                                      style: Styles.txtBlackColorW40012,
                                    ),
                                    Text(
                                      controller
                                                  .getOneTripData
                                                  ?.participants
                                                  ?.isNotEmpty ??
                                              false
                                          ? controller
                                                  .getOneTripData
                                                  ?.participants
                                                  ?.length
                                                  .toString() ??
                                              ""
                                          : "--",
                                      style: Styles.txtBlackColorW60012,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            Text("Location", style: Styles.txtBlackColorW40012),
                            Dimens.boxHeight6,
                            Text(
                              controller.getOneTripData?.location ?? " - ",
                              style: Styles.txtBlackColorW60012,
                            ),
                            Dimens.boxHeight10,
                            Text("Purpose", style: Styles.txtBlackColorW40012),
                            Dimens.boxHeight6,
                            Text(
                              controller.getOneTripData?.purpose ?? " - ",
                              style: Styles.txtBlackColorW60012,
                            ),
                            Dimens.boxHeight10,
                            if (controller.getOneTripData?.remark?.isNotEmpty ??
                                false) ...[
                              Text("Remark", style: Styles.txtBlackColorW40012),
                              Dimens.boxHeight6,
                              Text(
                                controller.getOneTripData?.remark ?? " - ",
                                style: Styles.txtBlackColorW60012,
                              ),
                              Dimens.boxHeight10,
                            ],
                            Row(
                              spacing: Dimens.ten,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    heightBtn: Dimens.fourtyFour,
                                    onPressed: () {
                                      controller.nameController.text =
                                          controller.getOneTripData?.tripname ??
                                          "";
                                      controller.purposeController.text =
                                          controller.getOneTripData?.purpose ??
                                          "";
                                      controller.selectStatus =
                                          controller.getOneTripData?.status;
                                      controller.selectCurrency =
                                          controller.getOneTripData?.currency;
                                      controller.budgetController.text =
                                          controller.getOneTripData?.budget
                                              ?.toString() ??
                                          "";
                                      controller.startDateController.text =
                                          controller
                                                      .getOneTripData
                                                      ?.start
                                                      ?.isNotEmpty ??
                                                  false
                                              ? DateFormat('yyyy-MM-dd').format(
                                                DateTime.parse(
                                                  controller
                                                          .getOneTripData
                                                          ?.start ??
                                                      "",
                                                ),
                                              )
                                              : "";
                                      controller.endDateController.text =
                                          controller
                                                      .getOneTripData
                                                      ?.end
                                                      ?.isNotEmpty ??
                                                  false
                                              ? DateFormat('yyyy-MM-dd').format(
                                                DateTime.parse(
                                                  controller
                                                          .getOneTripData
                                                          ?.end ??
                                                      "",
                                                ),
                                              )
                                              : "";
                                      controller.locationController.text =
                                          controller.getOneTripData?.location ??
                                          "";
                                      controller.remarkAddController.text =
                                          controller.getOneTripData?.remark ??
                                          "";
                                      controller.participantsList.clear();
                                      for (var i
                                          in controller
                                                  .getOneTripData
                                                  ?.participants ??
                                              <Participant>[]) {
                                        controller.participantsList.add(
                                          ParticipantsModel(selectMember: i.id),
                                        );
                                      }
                                      controller.selectImage =
                                          controller.getOneTripData?.image ??
                                          "";
                                      controller.update();
                                      RouteManagement.goToAddTripScreen();
                                    },
                                    text: "Edit Trip",
                                    textStyle: Styles.txtBlackColorW50014,
                                    backgroundColor: ColorsValue.whiteColor,
                                    borderColor: ColorsValue.txtBlackColor,
                                    isBorder: true,
                                    leading: SvgPicture.asset(
                                      AssetConstants.ic_edit,
                                      height: Dimens.twenty,
                                      width: Dimens.twenty,
                                    ),
                                    radius: Dimens.six,
                                  ),
                                ),
                                Expanded(
                                  child: CustomButton(
                                    heightBtn: Dimens.fourtyFour,
                                    radius: Dimens.six,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    Dimens.sixteen,
                                                  ),
                                            ),
                                            child: Padding(
                                              padding: Dimens.edgeInsets20,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "Delete Trip",
                                                    style:
                                                        Styles
                                                            .txtBlackColorW70018,
                                                  ),

                                                  Dimens.boxHeight10,

                                                  Text(
                                                    "Are you sure you want to delete this Trip?",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        Styles
                                                            .txtGreyColorW40014,
                                                  ),

                                                  Dimens.boxHeight20,

                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Expanded(
                                                        child: CustomButton(
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          text: "Cancel",
                                                          textStyle:
                                                              Styles
                                                                  .txtBlackColorW60016,
                                                          backgroundColor:
                                                              ColorsValue
                                                                  .transparent,
                                                          isBorder: true,
                                                          borderColor:
                                                              ColorsValue
                                                                  .txtBlackColor,
                                                          heightBtn:
                                                              Dimens.fourty,
                                                        ),
                                                      ),
                                                      Dimens.boxWidth10,
                                                      // Confirm Button
                                                      Expanded(
                                                        child: CustomButton(
                                                          heightBtn:
                                                              Dimens.fourty,
                                                          onPressed: () {
                                                            Get.back();
                                                            controller
                                                                .postTripDelete(
                                                                  tripId:
                                                                      controller
                                                                          .tripid ??
                                                                      "",
                                                                );
                                                          },
                                                          text: "Delete",
                                                          textStyle:
                                                              Styles
                                                                  .whiteColorW60016,
                                                          backgroundColor:
                                                              ColorsValue
                                                                  .redColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: "Delete",
                                    textStyle: Styles.redColorW50014,
                                    backgroundColor: ColorsValue.whiteColor,
                                    borderColor: ColorsValue.redColor,
                                    isBorder: true,
                                    leading: SvgPicture.asset(
                                      AssetConstants.ic_delete,
                                      height: Dimens.twenty,
                                      width: Dimens.twenty,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Expanse", style: Styles.txtBlackColorW70018),
                          GestureDetector(
                            onTap: () {
                              RouteManagement.goToAddExpenseTripScreen(null);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: Dimens.edgeInsets10_06_10_06,
                              decoration: BoxDecoration(
                                color: ColorsValue.appColor,
                                borderRadius: BorderRadius.circular(
                                  Dimens.four,
                                ),
                              ),
                              child: Text(
                                "Add Expanse",
                                style: Styles.whiteColorW50012,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Dimens.boxHeight15,
                      if (controller.filterExpenseList.isNotEmpty) ...[
                        SizedBox(
                          height: Dimens.thirty,
                          child: ListView.builder(
                            itemCount: controller.filterExpenseList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var item = controller.filterExpenseList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.selectExpense =
                                      item.expCategory?.name ?? "";
                                  controller.applyFilter();
                                  controller.update();
                                },
                                child: Container(
                                  margin: Dimens.edgeInsetsRight6,
                                  alignment: Alignment.center,
                                  padding: Dimens.edgeInsets16_04_16_04,
                                  decoration: BoxDecoration(
                                    color:
                                        controller.selectExpense ==
                                                (item.expCategory?.name ?? "")
                                            ? ColorsValue.appColor
                                            : ColorsValue.greyColor,
                                    borderRadius: BorderRadius.circular(
                                      Dimens.six,
                                    ),
                                  ),
                                  child: Text(
                                    item.expCategory?.name ?? "",
                                    style:
                                        controller.selectExpense ==
                                                (item.expCategory?.name ?? "")
                                            ? Styles.whiteColorW70016
                                            : Styles.txtBlackColorW70016,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Dimens.boxHeight15,
                        ListView.builder(
                          itemCount: controller.expenseList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = controller.expenseList[index];
                            return Container(
                              margin: Dimens.edgeInsetsTop10,
                              padding: Dimens.edgeInsets14,
                              decoration: BoxDecoration(
                                color: ColorsValue.textFieldBg,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.title ?? "",
                                        style: Styles.txtBlackColorW70016,
                                      ),
                                      Text(
                                        "₹ ${item.amount ?? "0"}",
                                        style: Styles.txtBlackColorW70016,
                                      ),
                                    ],
                                  ),
                                  Dimens.boxHeight6,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date :- ",
                                        style: Styles.txtBlackColorW50014,
                                      ),
                                      Text(
                                        item.date?.isNotEmpty ?? false
                                            ? Utility.getFormatedTime(
                                              item.date ?? "",
                                              "dd-MM-yyyy",
                                            )
                                            : "",
                                        style: Styles.txtGreyColorW40014,
                                      ),
                                    ],
                                  ),
                                  Dimens.boxHeight6,
                                  if (item.receipt?.isNotEmpty ?? false) ...[
                                    Text(
                                      "Receipt/Invoice",
                                      style: Styles.txtBlackColorW50014,
                                    ),
                                    Dimens.boxHeight6,
                                    GestureDetector(
                                      onTap: () {
                                        RouteManagement.goToShowFullScareenImage(
                                          item.receipt ?? "",
                                          "image",
                                        );
                                      },
                                      child: SizedBox(
                                        height: Dimens.ninty,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.network(
                                              item.receipt ?? "",
                                              width: double.infinity,
                                              height: Dimens.ninty,
                                              fit: BoxFit.cover,
                                            ),
                                            Container(
                                              color: ColorsValue.blackColor
                                                  .withAlpha(80),
                                            ),
                                            Center(
                                              child: Row(
                                                spacing: Dimens.six,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    AssetConstants.ic_view,
                                                  ),
                                                  Text(
                                                    "View",
                                                    style: Styles
                                                        .whiteColorW50014
                                                        .copyWith(
                                                          fontSize:
                                                              Dimens.sixteen,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  Dimens.boxHeight10,
                                  Row(
                                    spacing: Dimens.ten,
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          heightBtn: Dimens.fourtyFour,
                                          radius: Dimens.six,
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          Dimens.sixteen,
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        Dimens.edgeInsets20,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Delete Expense",
                                                          style:
                                                              Styles
                                                                  .txtBlackColorW70018,
                                                        ),

                                                        Dimens.boxHeight10,

                                                        Text(
                                                          "Are you sure you want to delete this Expense?",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              Styles
                                                                  .txtGreyColorW40014,
                                                        ),

                                                        Dimens.boxHeight20,

                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Expanded(
                                                              child: CustomButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                text: "Cancel",
                                                                textStyle:
                                                                    Styles
                                                                        .txtBlackColorW60016,
                                                                backgroundColor:
                                                                    ColorsValue
                                                                        .transparent,
                                                                isBorder: true,
                                                                borderColor:
                                                                    ColorsValue
                                                                        .txtBlackColor,
                                                                heightBtn:
                                                                    Dimens
                                                                        .fourty,
                                                              ),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            // Confirm Button
                                                            Expanded(
                                                              child: CustomButton(
                                                                heightBtn:
                                                                    Dimens
                                                                        .fourty,
                                                                onPressed: () {
                                                                  Get.back();
                                                                  controller
                                                                      .postExpenseDelete(
                                                                        item,
                                                                      );
                                                                },
                                                                text: "Delete",
                                                                textStyle:
                                                                    Styles
                                                                        .whiteColorW60016,
                                                                backgroundColor:
                                                                    ColorsValue
                                                                        .redColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          text: "Delete",
                                          textStyle: Styles.redColorW50014,
                                          backgroundColor:
                                              ColorsValue.whiteColor,
                                          borderColor: ColorsValue.redColor,
                                          isBorder: true,
                                          leading: SvgPicture.asset(
                                            AssetConstants.ic_delete,
                                            height: Dimens.twenty,
                                            width: Dimens.twenty,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          heightBtn: Dimens.fourtyFour,
                                          onPressed: () async {
                                            controller.titleController.text =
                                                item.title ?? "";
                                            controller.dateController.text =
                                                item.date?.isNotEmpty ?? false
                                                    ? DateFormat(
                                                      'yyyy-MM-dd',
                                                    ).format(
                                                      DateTime.parse(
                                                        item.date ?? "",
                                                      ),
                                                    )
                                                    : "";
                                            controller.selectExpenseCategory =
                                                item.expCategory?.id;
                                            controller.selectExpenseUser =
                                                item.expBy?.id;
                                            controller.amountController.text =
                                                item.amount?.toString() ?? "";
                                            controller.selectInvoice =
                                                item.receipt ?? "";

                                            controller.update();
                                            RouteManagement.goToAddExpenseTripScreen(
                                              item.id ?? "",
                                            );
                                          },
                                          text: "Edit Trip",
                                          textStyle: Styles.txtBlackColorW50014,
                                          backgroundColor:
                                              ColorsValue.whiteColor,
                                          borderColor:
                                              ColorsValue.txtBlackColor,
                                          isBorder: true,
                                          leading: SvgPicture.asset(
                                            AssetConstants.ic_edit,
                                            height: Dimens.twenty,
                                            width: Dimens.twenty,
                                          ),
                                          radius: Dimens.six,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  )
                  : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
