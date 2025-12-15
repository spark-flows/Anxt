import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindProductSRJO extends StatelessWidget {
  const FindProductSRJO({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Sr. Job No.",
            isCenter: true,
          ),
          backgroundColor: ColorsValue.appBg,
          body: SafeArea(
            child: Padding(
              padding: Dimens.edgeInsets20_00_20_00,
              child: Column(
                children: [
                  SizedBox(height: Get.height * .08),
                  Image.asset(AssetConstants.srjo_img),
                  SizedBox(height: Get.height * .08),
                  Text(
                    "Enter Sr Job No./Scan to unlock jewelry info",
                    style: Styles.color1E293BW70016,
                  ),
                  SizedBox(height: Get.height * .03),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Styles.color64748BW40012,
                      children: [
                        TextSpan(text: "Simply "),
                        TextSpan(
                          text: "scan the QR code",
                          style: TextStyle(
                            color: ColorsValue.lineColor,
                            fontSize: Dimens.twelve,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(text: " on your jewelry tag or "),
                        TextSpan(
                          text: "enter the Sr. Job Number",
                          style: TextStyle(
                            color: ColorsValue.lineColor,
                            fontSize: Dimens.twelve,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              " to view all product details - including metal purity, carat weight, certifications, pricing, craftsmanship insights, and authenticity verification.",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * .03),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "By Scan",
                          onPressed: () {
                            RouteManagement.goToProductDetailScreen(
                              srjNum: 'G22K',
                            );
                            // RouteManagement.goToScannerScreen();
                          },
                          heightBtn: 48,
                          radius: 14,
                          backgroundColor: ColorsValue.colorF6F6F6,
                          isBorder: true,
                          borderColor: ColorsValue.color94A3B8,
                          textStyle: Styles.txtBlackColorW50014,
                        ),
                      ),
                      SizedBox(width: Get.height * .03),
                      Expanded(
                        child: CustomButton(
                          text: "By Job No.",
                          onPressed: () {
                            showSrJobPopup(context);
                          },
                          heightBtn: 48,
                          radius: 14,
                          backgroundColor: ColorsValue.colorF6F6F6,
                          isBorder: true,
                          borderColor: ColorsValue.color94A3B8,
                          textStyle: Styles.txtBlackColorW50014,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showSrJobPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const SrJobPopup();
      },
    );
  }
}

class SrJobPopup extends StatelessWidget {
  const SrJobPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: Dimens.edgeInsets16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("By Sr. Job No.", style: Styles.color0F172AW60016),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: ColorsValue.color1E293B,
                  ),
                ),
              ],
            ),
            Dimens.boxHeight16,
            CustomTextFormField(
              isTitle: true,
              title: "Job No.",
              titleStyle: Styles.lineColorW70014,
              heightBtn: 48,
              radius: 0,
              isBorder: false,
              filled: true,
              fillColor: const Color(0xFFF3F4F6),
              hintText: "Enter Number",
              hintStyle: Styles.color94A3B8W50012,
              keyboardType: TextInputType.number,
            ),
            Dimens.boxHeight20,
            CustomButton(
              text: "View Details",
              onPressed: () {
                Get.back();
              },
              radius: 0,
              heightBtn: 48,
              backgroundColor: ColorsValue.appColor,
              textStyle: Styles.whiteColorW80018,
            ),
          ],
        ),
      ),
    );
  }
}
