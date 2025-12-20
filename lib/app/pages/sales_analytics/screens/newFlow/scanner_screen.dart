import 'package:a_nxt/app/pages/sales_analytics/sales_analytics_controller.dart';
import 'package:a_nxt/app/theme/colors_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) async {
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
              controller.getProductApi(
                srjobno: capture.barcodes.first.rawValue ?? '',
              );
              Get.back();
            },
          ),
        );
      },
    );
  }
}
