import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderHistoryDetailsScreen extends StatelessWidget {
  const OrderHistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'Sagar Miyani'.tr,
            isCenter: true,
          ),
          body: ListView(
            padding: Dimens.edgeInsets20_10_20_20,
            physics: ClampingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Items (10)", style: Styles.txtBlackColorW50016),
                  Row(
                    children: [
                      Text("Order No. :- ", style: Styles.txtBlackColorW50016),
                      Text("py-166-2025", style: Styles.txtGreyColorW50016),
                    ],
                  ),
                  Dimens.boxHeight10,
                ],
              ),
              Dimens.boxHeight10,
              Wrap(
                children:
                    controller.filterInterType.map((e) {
                      return Container(
                        margin: Dimens.edgeInsetsBottom10,
                        padding: Dimens.edgeInsets5,
                        decoration: BoxDecoration(
                          color: ColorsValue.appBg,
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.lineColor,
                          ),
                        ),
                        child: Row(
                          spacing: Dimens.ten,
                          children: [
                            Container(
                              height: Dimens.hundredTen,
                              width: Dimens.hundredTen,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimens.six),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Image.asset(
                                    AssetConstants.placeholder,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    margin: Dimens.edgeInsets5,
                                    height: Dimens.twenty,
                                    width: Dimens.fifty,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: ColorsValue.greyColorDFEFEF,
                                      borderRadius: BorderRadius.circular(
                                        Dimens.four,
                                      ),
                                    ),
                                    child: Text(
                                      "PY01",
                                      style: Styles.txtBlackColorW50012,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "P10126",
                                    style: Styles.txtBlackColorW70018,
                                  ),
                                  Dimens.boxHeight6,
                                  Row(
                                    children: [
                                      Text(
                                        "Sr. Job No. :- ",
                                        style: Styles.txtBlackColorW70014,
                                      ),
                                      Text(
                                        "1/5987",
                                        style: Styles.txtGreyColorW40014,
                                      ),
                                    ],
                                  ),
                                  Dimens.boxHeight6,
                                  Row(
                                    children: [
                                      Text(
                                        "Metal Type :- ",
                                        style: Styles.txtBlackColorW70014,
                                      ),
                                      Text(
                                        "GOLD 14K",
                                        style: Styles.txtGreyColorW40014,
                                      ),
                                    ],
                                  ),
                                  Dimens.boxHeight2,
                                  Row(
                                    children: [
                                      Text(
                                        "D.W :-  ",
                                        style: Styles.txtBlackColorW70014,
                                      ),
                                      Text(
                                        "1.235",
                                        style: Styles.txtGreyColorW40014,
                                      ),
                                    ],
                                  ),
                                  Dimens.boxHeight2,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "G.W :-  ",
                                            style: Styles.txtBlackColorW70014,
                                          ),
                                          Text(
                                            "1.235",
                                            style: Styles.txtGreyColorW40014,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "N.W :-  ",
                                            style: Styles.txtBlackColorW70014,
                                          ),
                                          Text(
                                            "1.235",
                                            style: Styles.txtGreyColorW40014,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
              Dimens.boxHeight10,
              Container(
                alignment: Alignment.center,
                height: Dimens.fiftyFive,
                padding: Dimens.edgeInsets10_00_10_00,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.twelve),
                  color: ColorsValue.lightGreenColor,
                ),
                child: ListTile(
                  contentPadding: Dimens.edgeInsets0,
                  leading: SvgPicture.asset(AssetConstants.ic_invoice),
                  title: Text(
                    "Download Invoice",
                    style: Styles.txtBlackColorW60016,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              Dimens.boxHeight10,
              Text("Payment Details", style: Styles.txtBlackColorW70016),
              Dimens.boxHeight10,
              Container(
                padding: Dimens.edgeInsets10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.ten),
                  color: ColorsValue.appBg,
                  border: Border.all(
                    width: Dimens.one,
                    color: ColorsValue.lineColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Payment Type :- ",
                          style: Styles.txtBlackColorW60014,
                        ),
                        Text("With Payment", style: Styles.txtGreyColorW60014),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      children: [
                        Text(
                          "Sale Type :- ",
                          style: Styles.txtBlackColorW60014,
                        ),
                        Text("Sales Invoice", style: Styles.txtGreyColorW60014),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Total Amount :- ",
                              style: Styles.txtBlackColorW60014,
                            ),
                            Text("\$1100", style: Styles.txtGreyColorW60014),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "R. Amount :- ",
                              style: Styles.txtBlackColorW60014,
                            ),
                            Text("\$600", style: Styles.txtGreyColorW60014),
                          ],
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Due Amount :- ",
                              style: Styles.txtBlackColorW60014,
                            ),
                            Text("\$1100", style: Styles.txtGreyColorW60014),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Due Date :- ",
                              style: Styles.txtBlackColorW60014,
                            ),
                            Text(
                              "25-05-2025",
                              style: Styles.txtGreyColorW60014,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      children: [
                        Text("Status :- ", style: Styles.txtBlackColorW60014),
                        Container(
                          padding: Dimens.edgeInsets08_04_08_04,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorsValue.lightYellowColor,
                            borderRadius: BorderRadius.circular(Dimens.four),
                          ),
                          child: Text(
                            "Pending",
                            style: Styles.yellowColorW70012,
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Text("Remark :- ", style: Styles.txtBlackColorW60014),
                    Dimens.boxHeight6,
                    Text(
                      "Lorem ipsum is typically a corrupted version of De finibus bonorum et malorum, a 1st-century BC text by the",
                      style: Styles.txtGreyColorW60014,
                    ),
                    Dimens.boxHeight10,
                    Text("Image", style: Styles.txtBlackColorW60014),
                    Dimens.boxHeight6,
                    SizedBox(
                      height: Dimens.hundred,
                      width: double.maxFinite,
                      child: Stack(
                        children: [
                          Image.asset(
                            AssetConstants.placeholder,
                            height: Dimens.hundred,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            color: ColorsValue.blackColor.withValues(
                              alpha: 0.4,
                            ),
                            height: Dimens.hundred,
                            width: double.maxFinite,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AssetConstants.ic_view_img,
                                    ),
                                    Dimens.boxWidth10,
                                    Text(
                                      "View Image",
                                      style: Styles.whiteColorW60014,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight10,
                    CustomButton(
                      onPressed: () {},
                      text: "Pay Payment",
                      textStyle: Styles.whiteColorW60016,
                      backgroundColor: ColorsValue.appColor,
                      radius: Dimens.four,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
