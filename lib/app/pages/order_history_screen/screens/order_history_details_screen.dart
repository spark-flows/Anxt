import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderHistoryDetailsScreen extends StatelessWidget {
  const OrderHistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(
      initState: (state) {
        final controller = Get.find<OrderHistoryController>();
        final argument = Get.arguments;
        controller.postOrderDetail(orderId: argument);
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: controller.getOneOrderData?.customerid?.name ?? ' - ',
            isCenter: true,
          ),
          body: ListView(
            padding: Dimens.edgeInsets20_10_20_20,
            physics: ClampingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Items (${controller.getOneOrderData?.summary?.quantity})",
                    style: Styles.txtBlackColorW50016,
                  ),
                  Text(
                    "Order No. :- ${controller.getOneOrderData?.orderno}",
                    style: Styles.txtBlackColorW50016,
                  ),
                ],
              ),
              Dimens.boxHeight10,
              Wrap(
                children:
                    (controller.getOneOrderData?.items ?? []).map((e) {
                      return GestureDetector(
                        onTap: () {
                          RouteManagement.goToOrderDetailScreen(
                            srjNum: e.jobno ?? "",
                          );
                        },
                        child: Container(
                          margin: Dimens.edgeInsetsBottom5,
                          padding: Dimens.edgeInsets5,
                          decoration: BoxDecoration(
                            color: ColorsValue.textFieldBg,
                            borderRadius: BorderRadius.circular(Dimens.ten),
                            border: Border.all(
                              width: Dimens.one,
                              color: ColorsValue.greyCBD5E1,
                            ),
                          ),
                          child: Row(
                            spacing: Dimens.ten,
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      'https://thrivenextgen.com/wp-content/uploads/AdobeStock_162765779_45-scaled.webp',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      margin: Dimens.edgeInsets5,
                                      decoration: BoxDecoration(
                                        color: ColorsValue.colorDFEFEF,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 1,
                                        ),
                                        child: Text(
                                          'PY01',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorsValue.txtBlackColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _buildRow(
                                          'Job No. :- ',
                                          e.jobno ?? '',
                                          isBold: true,
                                        ),
                                        _buildRow(
                                          'Qta :- ',
                                          e.quantity.toString(),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _buildRow(
                                          'Quality :- ',
                                          e.metalQuality ?? '',
                                        ),
                                        _buildRow(
                                          'G.W :- ',
                                          e.grossweight ?? ' - ',
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight2,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _buildRow(
                                          'D.W :- ',
                                          e.fineweight ?? ' - ',
                                        ),
                                        _buildRow(
                                          'O.W :- ',
                                          e.fineweight ?? ' - ',
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight2,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _buildRow(
                                          'N.W :- ',
                                          e.netweight ?? ' - ',
                                        ),
                                        _buildRow(
                                          'Price :- ',
                                          Utility.formatIndianCurrency(
                                            e.diamondamount ?? 0,
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
                    }).toList(),
              ),
              Dimens.boxHeight10,
              Container(
                alignment: Alignment.center,
                height: Dimens.fiftyFive,
                padding: Dimens.edgeInsets10_00_10_00.copyWith(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.twelve),
                  color: ColorsValue.txtBlackColor,
                ),
                child: ListTile(
                  contentPadding: Dimens.edgeInsets0,
                  leading: SvgPicture.asset(
                    AssetConstants.ic_invoice,
                    colorFilter: ColorFilter.mode(
                      ColorsValue.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    "Download Invoice",
                    style: Styles.whiteColorW60016,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorsValue.whiteColor,
                  ),
                ),
              ),
              Dimens.boxHeight10,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: ColorsValue.colorDCAC75,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount", style: Styles.whiteColorW70018),
                      Text(
                        "₹ ${Utility.formatIndianCurrency(controller.getOneOrderData?.summary?.totalamount ?? 0)}",
                        style: Styles.whiteColorW70018,
                      ),
                    ],
                  ),
                ),
              ),
              // CustomButton(
              //   onPressed: () {},
              //   text: "Pay Payment",
              //   textStyle: Styles.whiteColorW60016,
              //   backgroundColor: ColorsValue.appColor,
              //   radius: Dimens.four,
              // ),
              // Text("Payment Details", style: Styles.txtBlackColorW70016),
              // Dimens.boxHeight10,
              // Container(
              //   padding: Dimens.edgeInsets10,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(Dimens.ten),
              //     color: ColorsValue.appBg,
              //     border: Border.all(
              //       width: Dimens.one,
              //       color: ColorsValue.lineColor,
              //     ),
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         children: [
              //           Text(
              //             "Payment Type :- ",
              //             style: Styles.txtBlackColorW60014,
              //           ),
              //           Text("With Payment", style: Styles.txtGreyColorW60014),
              //         ],
              //       ),
              //       Dimens.boxHeight10,
              //       Row(
              //         children: [
              //           Text(
              //             "Sale Type :- ",
              //             style: Styles.txtBlackColorW60014,
              //           ),
              //           Text("Sales Invoice", style: Styles.txtGreyColorW60014),
              //         ],
              //       ),
              //       Dimens.boxHeight10,
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Row(
              //             children: [
              //               Text(
              //                 "Total Amount :- ",
              //                 style: Styles.txtBlackColorW60014,
              //               ),
              //               Text("₹1100", style: Styles.txtGreyColorW60014),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Text(
              //                 "R. Amount :- ",
              //                 style: Styles.txtBlackColorW60014,
              //               ),
              //               Text("₹600", style: Styles.txtGreyColorW60014),
              //             ],
              //           ),
              //         ],
              //       ),
              //       Dimens.boxHeight10,
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Row(
              //             children: [
              //               Text(
              //                 "Due Amount :- ",
              //                 style: Styles.txtBlackColorW60014,
              //               ),
              //               Text("₹1100", style: Styles.txtGreyColorW60014),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Text(
              //                 "Due Date :- ",
              //                 style: Styles.txtBlackColorW60014,
              //               ),
              //               Text(
              //                 "25-05-2025",
              //                 style: Styles.txtGreyColorW60014,
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       Dimens.boxHeight10,
              //       Row(
              //         children: [
              //           Text("Status :- ", style: Styles.txtBlackColorW60014),
              //           Container(
              //             padding: Dimens.edgeInsets08_04_08_04,
              //             alignment: Alignment.center,
              //             decoration: BoxDecoration(
              //               color: ColorsValue.lightYellowColor,
              //               borderRadius: BorderRadius.circular(Dimens.four),
              //             ),
              //             child: Text(
              //               "Pending",
              //               style: Styles.yellowColorW70012,
              //             ),
              //           ),
              //         ],
              //       ),
              //       Dimens.boxHeight10,
              //       Text("Remark :- ", style: Styles.txtBlackColorW60014),
              //       Dimens.boxHeight6,
              //       Text(
              //         "Lorem ipsum is typically a corrupted version of De finibus bonorum et malorum, a 1st-century BC text by the",
              //         style: Styles.txtGreyColorW60014,
              //       ),
              //       Dimens.boxHeight10,
              //       Text("Image", style: Styles.txtBlackColorW60014),
              //       Dimens.boxHeight6,
              //       SizedBox(
              //         height: Dimens.hundred,
              //         width: double.maxFinite,
              //         child: Stack(
              //           children: [
              //             Image.asset(
              //               AssetConstants.placeholder,
              //               height: Dimens.hundred,
              //               width: double.maxFinite,
              //               fit: BoxFit.cover,
              //             ),
              //             Container(
              //               color: ColorsValue.blackColor.withValues(
              //                 alpha: 0.4,
              //               ),
              //               height: Dimens.hundred,
              //               width: double.maxFinite,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         AssetConstants.ic_view_img,
              //                       ),
              //                       Dimens.boxWidth10,
              //                       Text(
              //                         "View Image",
              //                         style: Styles.whiteColorW60014,
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Dimens.boxHeight10,
              //       CustomButton(
              //         onPressed: () {},
              //         text: "Pay Payment",
              //         textStyle: Styles.whiteColorW60016,
              //         backgroundColor: ColorsValue.appColor,
              //         radius: Dimens.four,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style:
                isBold
                    ? Styles.txtBlackColorW70018
                    : Styles.txtBlackColorW70014,
          ),
          Text(
            value,
            style:
                isBold ? Styles.txtGreyColorW40018 : Styles.txtGreyColorW40014,
          ),
        ],
      ),
    );
  }
}
