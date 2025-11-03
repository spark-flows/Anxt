import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SalesAnalyticsDetailsScreen extends StatelessWidget {
  const SalesAnalyticsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) {
        final controller = Get.find<SalesAnalyticsController>();
        final argument = Get.arguments;
        controller.postGetOneUser(salesid: argument);
      },
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
              GestureDetector(
                onTap: () {
                  RouteManagement.goToSalesAnalyticsScreen();
                },
                child: Padding(
                  padding: Dimens.edgeInsetsRight16,
                  child: SvgPicture.asset(AssetConstants.ic_edit),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets20,
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    heightBtn: Dimens.fifty,
                    radius: Dimens.zero,
                    onPressed: () {},
                    text: 'Save',
                    textStyle: Styles.whiteColorW60016,
                    backgroundColor: ColorsValue.appColor,
                  ),
                ),
                Dimens.boxWidth20,
                Expanded(
                  child: CustomButton(
                    heightBtn: Dimens.fifty,
                    radius: Dimens.zero,
                    onPressed: () {
                      RouteManagement.goToSalesAnalyticsProductScreen();
                    },
                    text: 'Next',
                    isBorder: true,
                    borderColor: ColorsValue.txtBlackColor,
                    textStyle: Styles.txtBlackColorW60016,
                    backgroundColor: ColorsValue.transparent,
                    traling: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            padding: Dimens.edgeInsets20_10_20_20,
            physics: ClampingScrollPhysics(),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: Dimens.fifty,
                      color: ColorsValue.appColor,
                      alignment: Alignment.center,
                      child: Text("Store In", style: Styles.whiteColorW70016),
                    ),
                  ),
                  Dimens.boxWidth20,
                  Expanded(
                    child: Container(
                      height: Dimens.fifty,
                      color: ColorsValue.appColor,
                      alignment: Alignment.center,
                      child: Text("Store Out", style: Styles.whiteColorW70016),
                    ),
                  ),
                ],
              ),
              Dimens.boxHeight20,
              Container(
                padding: Dimens.edgeInsets20,
                color: ColorsValue.textFieldBg,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date", style: Styles.txtBlackColorW40012),
                        Text("Status", style: Styles.txtBlackColorW40012),
                      ],
                    ),
                    Dimens.boxHeight6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: Dimens.six,
                          children: [
                            SvgPicture.asset(
                              AssetConstants.ic_date,
                              height: Dimens.twelve,
                            ),
                            Text(
                              Utility.getFormatedTime(
                                user?.createdAt.toString() ?? '',
                                'dd-MM-yyyy',
                              ),
                              style: Styles.txtBlackColorW60012,
                            ),
                          ],
                        ),
                        Container(
                          padding: Dimens.edgeInsets06_04_06_04,
                          decoration: BoxDecoration(
                            color: ColorsValue.appColor,
                            borderRadius: BorderRadius.circular(Dimens.four),
                          ),
                          child: Text(
                            user?.status.toString() ?? "Pending",
                            style: Styles.whiteColorW50010,
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mobile Number",
                          style: Styles.txtBlackColorW40012,
                        ),
                        Text("Email", style: Styles.txtBlackColorW40012),
                      ],
                    ),
                    Dimens.boxHeight6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: Dimens.six,
                          children: [
                            SvgPicture.asset(
                              AssetConstants.ic_date,
                              height: Dimens.twelve,
                            ),
                            Text(
                              user?.mobile ?? " - ",
                              style: Styles.txtBlackColorW60012,
                            ),
                          ],
                        ),
                        Text(
                          user?.email ?? " - ",
                          style: Styles.txtBlackColorW60012,
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("State", style: Styles.txtBlackColorW40012),
                        Text("City", style: Styles.txtBlackColorW40012),
                      ],
                    ),
                    Dimens.boxHeight6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: Dimens.six,
                          children: [
                            SvgPicture.asset(
                              AssetConstants.ic_date,
                              height: Dimens.twelve,
                            ),
                            Text(
                              user?.state ?? "Gujarat",
                              style: Styles.txtBlackColorW60012,
                            ),
                          ],
                        ),
                        Text("Surat", style: Styles.txtBlackColorW60012),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Area", style: Styles.txtBlackColorW40012),
                        Text("Zip Code", style: Styles.txtBlackColorW40012),
                      ],
                    ),
                    Dimens.boxHeight6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: Dimens.six,
                          children: [
                            SvgPicture.asset(
                              AssetConstants.ic_date,
                              height: Dimens.twelve,
                            ),
                            Text(
                              user?.address ?? ' - ',
                              style: Styles.txtBlackColorW60012,
                            ),
                          ],
                        ),
                        Text(
                          user?.zipcode ?? " - ",
                          style: Styles.txtBlackColorW60012,
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Text("Store Address", style: Styles.txtBlackColorW40012),
                    Dimens.boxHeight6,
                    Text(
                      user?.address ?? " - ",
                      style: Styles.txtBlackColorW60012,
                    ),
                  ],
                ),
              ),
              Dimens.boxHeight20,
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
                    controller.selectProduct = value!;
                    controller.update();
                  },
                  hint: Text(
                    'Product'.tr,
                    style: Styles.txtGreyColorW50012.copyWith(
                      fontSize:
                          Utility.isTablet()
                              ? Dimens.eighteen
                              : Dimens.fourteen,
                    ),
                  ),
                  focusColor: Colors.white,
                  dropdownColor: ColorsValue.whiteColor,
                  value: controller.selectProduct,
                  style: Styles.txtBlackColorW50014,
                  iconEnabledColor: Colors.black,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: Dimens.twenty,
                  ),
                  items:
                      controller.filterOnboardType.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(
                            option,
                            style: Styles.txtBlackColorW50014.copyWith(
                              fontSize:
                                  Utility.isTablet()
                                      ? Dimens.twenty
                                      : Dimens.fourteen,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
