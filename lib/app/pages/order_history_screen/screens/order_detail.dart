import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/app/widgets/custom_listtileView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailScreen extends StatelessWidget {
  OrderDetailScreen({super.key});

  String srjoNum = ' - ';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(
      initState: (state) {
        final controller = Get.find<OrderHistoryController>();
        srjoNum = Get.arguments;
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Job No.$srjoNum",
            isCenter: true,
          ),
          backgroundColor: ColorsValue.textFieldBg,

          body: SafeArea(
            child: Padding(
              padding: Dimens.edgeInsets20_00_20_00,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            width: double.infinity,
                            'https://thrivenextgen.com/wp-content/uploads/AdobeStock_162765779_45-scaled.webp',
                            height: Get.height * .24,
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
                                horizontal: 10,
                                vertical: 4,
                              ),
                              child: Text(
                                'TGTRV',
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
                    DetailsExpansion(
                      title: "Metal Details",
                      header: const [
                        "Code",
                        "G.W",
                        "N.W",
                        "Purity",
                        "Fine",
                        "Rate",
                      ],
                      rows: const [
                        ["G14KTR", "6.381", "6.220", "74.00", "4.603", "7450"],
                      ],
                      totalRow: const ["", "6.381", "6.220", "", "4.603", ""],
                    ),

                    // Diamond Details
                    DetailsExpansion(
                      title: "Diamond Details",
                      header: const [
                        "Code",
                        "Size",
                        "Pcs",
                        "Weight",
                        "Rate",
                        "Amount",
                      ],
                      rows: const [
                        ["Gold", "0.010-0.110", "2", "0.190", "17800", "3382"],
                        ["Round", "0.010-0.110", "2", "0.220", "17800", "3382"],
                        ["MOP", "0.010-0.110", "6", "0.220", "17800", "3382"],
                        ["Marquise", "+6-11", "60", "0.220", "17800", "3382"],
                        ["Round", "+6-11", "10", "0.220", "17800", "3382"],
                      ],
                      totalRow: const ["", "", "80", "0.220", "", "16910"],
                    ),

                    // Stone Details
                    DetailsExpansion(
                      title: "Stone Details",
                      header: const ["Code", "Weight", "Rate", "Amount"],
                      rows: const [
                        ["G14KTR", "0.190", "1700", "11560"],
                      ],
                      totalRow: const ["", "0.190", "", "11560"],
                    ),

                    // Other Details
                    DetailsExpansion(
                      title: "Other Details",
                      header: const ["Code", "Amount"],
                      rows: const [
                        ["G14KTR", "11560"],
                      ],
                      totalRow: const ["", "11560"],
                    ),

                    // Making Details
                    DetailsExpansion(
                      title: "Making Details",
                      header: const ["Rate", "Amount"],
                      rows: const [
                        ["1700", "1600"],
                      ],
                      totalRow: const ["", "1600"],
                    ),

                    Dimens.boxHeight10,
                    Text("Price Master", style: Styles.lineColorW70014),
                    Dimens.boxHeight4,
                    Container(
                      padding: Dimens.edgeInsets20_00_20_00,
                      height:
                          Utility.isTablet() ? Dimens.sixtyFive : Dimens.fifty,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorsValue.whiteColor,
                        borderRadius: BorderRadius.circular(Dimens.ten),
                        // border:
                        //     showError && controller.selectStatus == null
                        //         ? Border.all(color: Colors.red)
                        //         : null,
                      ),
                      child: DropdownButton<String>(
                        underline: Container(),
                        isDense: true,
                        isExpanded: true,
                        value: controller.paymentMaster,
                        hint: Text('Select Price Master'),
                        onChanged: (value) {
                          controller.paymentMaster = value;
                          controller.paymentMaster = null;
                          controller.nextDateController.clear();
                          // showError = false;
                          controller.update();
                          // setState(() {});
                        },
                        items:
                            controller.paymentMasterList
                                .map(
                                  (option) => DropdownMenuItem(
                                    value: option,
                                    child: Text(option),
                                  ),
                                )
                                .toList(),
                      ),
                    ),

                    Dimens.boxHeight10,

                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(
                        //   color: const Color(0xFFE0E0E0),
                        //   width: 1.5,
                        // ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Header
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: ColorsValue.color94A3B8,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Lab Grown Diamond',
                                style: Styles.txtBlackColorW70014,
                              ),
                            ),
                          ),

                          // Options Row
                          IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: _buildOptionTile(
                                      label: '18K :-',
                                      price: '\$1500',
                                      isSelected: controller.is18KSelected,
                                      onTap: () {
                                        controller.is18KSelected =
                                            !controller.is18KSelected;
                                        controller.update();
                                      },
                                    ),
                                  ),

                                  Expanded(
                                    child: _buildOptionTile(
                                      label: '14K :-',
                                      price: '\$1000',
                                      isSelected: controller.is14KSelected,
                                      onTap: () {
                                        controller.is14KSelected =
                                            !controller.is14KSelected;
                                        controller.update();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     border: Border(
                    //       bottom: BorderSide(
                    //         color: Color(0xFFE0E0E0),
                    //         width: 1.5,
                    //       ),
                    //     ),
                    //   ),
                    //   child: IntrinsicHeight(
                    //     child: Row(
                    //       children: [
                    //         // 18K Option
                    //         Expanded(
                    //           child: _buildOptionTile(
                    //             label: '18K :-',
                    //             price: '\$1500',
                    //             isSelected: controller.is18KSelected,
                    //             onTap: () {
                    //               controller.is18KSelected =
                    //                   !controller.is18KSelected;
                    //               controller.update();
                    //             },
                    //           ),
                    //         ),

                    //         // Vertical Divider
                    //         Container(
                    //           width: 1.5,
                    //           color: const Color(0xFFE0E0E0),
                    //         ),

                    //         // 14K Option
                    //         Expanded(
                    //           child: _buildOptionTile(
                    //             label: '14K :-',
                    //             price: '\$1000',
                    //             isSelected: controller.is14KSelected,
                    //             onTap: () {
                    //               controller.is14KSelected =
                    //                   !controller.is14KSelected;
                    //               controller.update();
                    //             },
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Dimens.boxHeight10,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorsValue.appColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Final Amount', style: Styles.whiteColorW70018),
                          Text(
                            controller.calculateTotal(41630).toString(),
                            style: Styles.whiteColorW70018.copyWith(
                              fontSize: 20,
                            ),
                            // const TextStyle(
                            //   fontSize: 20,
                            //   fontWeight: FontWeight.w700,
                            //   color: Colors.white,
                            // ),
                          ),
                        ],
                      ),
                    ),

                    Dimens.boxHeight30,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOptionTile({
    required String label,
    required String price,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: const Color(0xFFE0E0E0), width: 1),
          ),
          color: isSelected ? const Color(0xFFF5F5F5) : Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(label, style: Styles.txtBlackColorW70014),
            ),
            VerticalDivider(color: ColorsValue.color94A3B8),
            Text(price, style: Styles.color64748BW50014),
          ],
        ),
      ),
    );
  }
}
