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
                  RouteManagement.goToSalesAnalyticsScreen(
                    customerDetail: user,
                  );
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
                // Expanded(
                //   child: CustomButton(
                //     heightBtn: Dimens.fifty,
                //     radius: Dimens.zero,
                //     onPressed: () {},
                //     text: 'Save',
                //     textStyle: Styles.whiteColorW60016,
                //     backgroundColor: ColorsValue.appColor,
                //   ),
                // ),
                // Dimens.boxWidth20,
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
              if (user?.status != 'completed' ||
                  user?.status != null ||
                  user!.status!.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.postSalesCreate(
                            storeInDate: DateTime.now(),
                            mode: 'storeIn',
                          );
                          controller.update();
                        },
                        child: Container(
                          height: Dimens.fifty,
                          color: ColorsValue.appColor,
                          alignment: Alignment.center,
                          child: Text(
                            "Store In",
                            style: Styles.whiteColorW70016,
                          ),
                        ),
                      ),
                    ),
                    Dimens.boxWidth20,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.postSalesCreate(
                            storeOutDate: DateTime.now(),
                            mode: 'storeOut',
                          );
                          controller.update();
                        },
                        child: Container(
                          height: Dimens.fifty,
                          color: ColorsValue.appColor,
                          alignment: Alignment.center,
                          child: Text(
                            "Store Out",
                            style: Styles.whiteColorW70016,
                          ),
                        ),
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
                            user?.sales?.first.status != ""
                                ? user?.sales?.first.status.toString() ??
                                    "Pending"
                                : 'Pending',
                            style: Styles.whiteColorW50010,
                          ),
                        ),
                      ],
                    ),
                    if ((user?.mobile?.isNotEmpty ?? user?.mobile != "") ||
                        (user?.email!.isNotEmpty ?? user?.email != "")) ...[
                      Dimens.boxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (user?.mobile?.isNotEmpty ?? user?.mobile != "")
                            Text(
                              "Mobile Number",
                              style: Styles.txtBlackColorW40012,
                            ),
                          if (user?.email?.isNotEmpty ?? user?.email != "")
                            Text("Email", style: Styles.txtBlackColorW40012),
                        ],
                      ),
                      Dimens.boxHeight6,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (user?.mobile?.isNotEmpty ?? user?.mobile != "")
                            Text(
                              user?.mobile ?? " - ",
                              style: Styles.txtBlackColorW60012,
                            ),
                          if (user?.email?.isNotEmpty ?? user?.email != "")
                            Text(
                              user?.email ?? " - ",
                              style: Styles.txtBlackColorW60012,
                            ),
                        ],
                      ),
                    ],

                    if ((user?.state?.isNotEmpty ?? user?.state != "") ||
                        (user?.city?.isNotEmpty ?? user?.city != "")) ...[
                      Dimens.boxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (user?.state?.isNotEmpty ?? user?.state != "")
                            Text("State", style: Styles.txtBlackColorW40012),
                          if (user?.city?.isNotEmpty ?? user?.city != "")
                            Text("City", style: Styles.txtBlackColorW40012),
                        ],
                      ),
                      Dimens.boxHeight6,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (user?.state?.isNotEmpty ?? user?.state != "")
                            Text(
                              user?.state ?? "Gujarat",
                              style: Styles.txtBlackColorW60012,
                            ),
                          if (user?.city?.isNotEmpty ?? user?.city != "")
                            Text(
                              user?.city ?? '',
                              style: Styles.txtBlackColorW60012,
                            ),
                        ],
                      ),
                    ],
                    if ((user?.area?.isNotEmpty ?? user?.area != "") ||
                        (user?.zipcode?.isNotEmpty ?? user?.zipcode != "")) ...[
                      Dimens.boxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (user?.area?.isNotEmpty ?? user?.area != "")
                            Text("Area", style: Styles.txtBlackColorW40012),
                          if (user?.zipcode?.isNotEmpty ?? user?.zipcode != "")
                            Text("Zip Code", style: Styles.txtBlackColorW40012),
                        ],
                      ),
                      Dimens.boxHeight6,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (user?.area?.isNotEmpty ?? user?.area != "")
                            Text(
                              user?.area ?? ' - ',
                              style: Styles.txtBlackColorW60012,
                            ),
                          if (user?.zipcode?.isNotEmpty ?? user?.zipcode != "")
                            Text(
                              user?.zipcode ?? " - ",
                              style: Styles.txtBlackColorW60012,
                            ),
                        ],
                      ),
                    ],

                    if (user?.address?.isNotEmpty ?? user?.address != "") ...[
                      Dimens.boxHeight10,
                      Text("Store Address", style: Styles.txtBlackColorW40012),
                      Dimens.boxHeight6,
                      Text(
                        user?.address ?? " - ",
                        style: Styles.txtBlackColorW60012,
                      ),
                    ],
                  ],
                ),
              ),
              Dimens.boxHeight20,
            ],
          ),
        );
      },
    );
  }
}
