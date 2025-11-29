import 'package:a_nxt/app/app.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TripController>(
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
          bottomNavigationBar: SafeArea(
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
                            controller.statusCandidateList.map((e) {
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
                                          "Food",
                                          style: Styles.txtBlackColorW50014,
                                        ),
                                        Text(
                                          "(1 item)",
                                          style: Styles.txtGreyColorW50014,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "\$400.00",
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
                        Text("Total", style: Styles.txtBlackColorW60014),
                        Text("\$1018.20", style: Styles.txtBlackColorW60014),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: ListView(
            padding: Dimens.edgeInsets20_10_20_20,
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                height: Dimens.twoHundred,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.ten),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.ten),
                  child: Image.asset(
                    AssetConstants.placeholder,
                    fit: BoxFit.cover,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: Dimens.six,
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.ic_date,
                                  height: Dimens.twelve,
                                  width: Dimens.twelve,
                                ),
                                Text(
                                  "27-05-2002",
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
                            Text("Status", style: Styles.txtBlackColorW40012),
                            Container(
                              alignment: Alignment.center,
                              padding: Dimens.edgeInsets06_02_06_02,
                              decoration: BoxDecoration(
                                color: ColorsValue.appColorEBBD87,
                                borderRadius: BorderRadius.circular(
                                  Dimens.four,
                                ),
                              ),
                              child: Text(
                                "Pending",
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: Dimens.six,
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.ic_date,
                                  height: Dimens.twelve,
                                  width: Dimens.twelve,
                                ),
                                Text(
                                  "27-05-2002",
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
                            Text("End Date", style: Styles.txtBlackColorW40012),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: Dimens.six,
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.ic_date,
                                  height: Dimens.twelve,
                                  width: Dimens.twelve,
                                ),
                                Text(
                                  "27-05-2002",
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
                            Text("₹650000", style: Styles.txtBlackColorW60012),
                          ],
                        ),
                        Column(
                          spacing: Dimens.six,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Members", style: Styles.txtBlackColorW40012),
                            Text("02", style: Styles.txtBlackColorW60012),
                          ],
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Text("Location", style: Styles.txtBlackColorW40012),
                    Dimens.boxHeight6,
                    Text(
                      "Al Fahidi Historical Neighbourhood, Dubai ",
                      style: Styles.txtBlackColorW60012,
                    ),
                    Dimens.boxHeight10,
                    Text("Purpose", style: Styles.txtBlackColorW40012),
                    Dimens.boxHeight6,
                    Text("Business Meting", style: Styles.txtBlackColorW60012),
                    Dimens.boxHeight10,
                    Text("Remark", style: Styles.txtBlackColorW40012),
                    Dimens.boxHeight6,
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: Styles.txtBlackColorW60012,
                    ),
                    Dimens.boxHeight10,
                    Row(
                      spacing: Dimens.ten,
                      children: [
                        Expanded(
                          child: CustomButton(
                            heightBtn: Dimens.fourtyFour,
                            onPressed: () {},
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
                            onPressed: () {},
                            text: "Delete",
                            textStyle: Styles.redColor50014,
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
                      RouteManagement.goToAddExpenseTripScreen();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: Dimens.edgeInsets10_06_10_06,
                      decoration: BoxDecoration(
                        color: ColorsValue.appColor,
                        borderRadius: BorderRadius.circular(Dimens.four),
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
              SizedBox(
                height: Dimens.thirty,
                child: ListView.builder(
                  itemCount: controller.expenseType.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = controller.expenseType[index];
                    return GestureDetector(
                      onTap: () {
                        controller.selectExpense = index;
                        controller.update();
                      },
                      child: Container(
                        margin: Dimens.edgeInsetsRight6,
                        alignment: Alignment.center,
                        padding: Dimens.edgeInsets16_04_16_04,
                        decoration: BoxDecoration(
                          color:
                              controller.selectExpense == index
                                  ? ColorsValue.appColor
                                  : ColorsValue.greyColor,
                          borderRadius: BorderRadius.circular(Dimens.six),
                        ),
                        child: Text(
                          item,
                          style:
                              controller.selectExpense == index
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
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: Dimens.edgeInsetsTop10,
                    padding: Dimens.edgeInsets14,
                    decoration: BoxDecoration(color: ColorsValue.textFieldBg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Traveling",
                              style: Styles.txtBlackColorW70016,
                            ),
                            Text("€250", style: Styles.txtBlackColorW70016),
                          ],
                        ),
                        Dimens.boxHeight6,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date :- ", style: Styles.txtBlackColorW50014),
                            Text(
                              "23-12-2002",
                              style: Styles.txtGreyColorW40014,
                            ),
                          ],
                        ),
                        Dimens.boxHeight6,
                        Text(
                          "Receipt/Invoice",
                          style: Styles.txtBlackColorW50014,
                        ),
                        Dimens.boxHeight6,
                        SizedBox(
                          height: Dimens.ninty,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                AssetConstants.placeholder,
                                width: double.infinity,
                                height: Dimens.ninty,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: ColorsValue.blackColor.withAlpha(80),
                              ),
                              Center(
                                child: Row(
                                  spacing: Dimens.six,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(AssetConstants.ic_view),
                                    Text(
                                      "View",
                                      style: Styles.whiteColorW50014.copyWith(
                                        fontSize: Dimens.sixteen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Dimens.boxHeight10,
                        Row(
                          spacing: Dimens.ten,
                          children: [
                            Expanded(
                              child: CustomButton(
                                heightBtn: Dimens.fourtyFour,
                                radius: Dimens.six,
                                onPressed: () {},
                                text: "Delete",
                                textStyle: Styles.redColor50014,
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
                            Expanded(
                              child: CustomButton(
                                heightBtn: Dimens.fourtyFour,
                                onPressed: () {},
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
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
