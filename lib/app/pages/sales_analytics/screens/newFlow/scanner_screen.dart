import 'package:a_nxt/app/pages/sales_analytics/sales_analytics_controller.dart';
import 'package:a_nxt/app/theme/colors_value.dart';
import 'package:a_nxt/domain/models/getoneUser_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  ScannerScreen({super.key});

  GetOneUserData getOneUserData = GetOneUserData();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) async {
        getOneUserData = Get.arguments;
        // RouteManagement.goToProductDetailScreen(srjNum: 'G22K');
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          body: MobileScanner(
            controller: MobileScannerController(
              formats: [BarcodeFormat.qrCode],
            ),
            fit: BoxFit.cover,
            onDetect: (BarcodeCapture capture) {
              controller.getScaneData(
                jobNo: capture.barcodes.first.rawValue ?? '',
                customerId: getOneUserData,
              );
              Get.back();
            },
          ),
        );
      },
    );
  }
}
