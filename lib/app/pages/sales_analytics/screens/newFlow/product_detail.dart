import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/app/widgets/custom_listtileView.dart';
import 'package:a_nxt/domain/models/priceMaster_model.dart';
import 'package:a_nxt/domain/models/product_detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  ProductDetailData? productDetail;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) {
        final controller = Get.find<SalesAnalyticsController>();
        productDetail = Get.arguments;
        controller.postPriceMasterList();
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Job No.${productDetail?.jobno}",
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
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          child: CachedNetworkImage(
                            imageUrl: productDetail?.image ?? "",
                            fit: BoxFit.cover,
                            height: Get.height * .24,
                            width: double.infinity,
                            placeholder: (context, url) {
                              return Image.asset(
                                'https://thrivenextgen.com/wp-content/uploads/AdobeStock_162765779_45-scaled.webp',
                                fit: BoxFit.cover,
                                height: Get.height * .24,
                                width: double.infinity,
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                'https://thrivenextgen.com/wp-content/uploads/AdobeStock_162765779_45-scaled.webp',
                                fit: BoxFit.cover,
                                height: Get.height * .24,
                                width: double.infinity,
                              );
                            },
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
                      rows:
                          (productDetail?.metalcomponents ?? []).map((metal) {
                            return [
                              metal.shape ?? ' - '.trim(),
                              metal.grossweight?.toString() ?? "0",
                              metal.netweight?.toString() ?? "0",
                              "${metal.priceRatio ?? 0}%",
                              metal.fineweight?.toString() ?? "0",
                              Utility.formatIndianCurrency(metal.rate ?? 0),
                            ];
                          }).toList(),
                      totalRow: [
                        "",
                        productDetail?.grossweight ?? "0",
                        productDetail?.netweight ?? "0",
                        "",
                        productDetail?.fineweight ?? "0",
                        "",
                      ],
                      // rows: const [
                      //   ["G14KTR", "6.381", "6.220", "74.00", "4.603", "7450"],
                      // ],
                      // totalRow: const ["", "6.381", "6.220", "", "4.603", ""],
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
                      rows:
                          (productDetail?.diamondcomponents ?? []).map((
                            diamond,
                          ) {
                            return [
                              diamond.size ?? "",
                              diamond.pcs?.toString() ?? "0",
                              diamond.weight?.toString() ?? "0",
                              Utility.formatIndianCurrency(diamond.rate ?? 0),
                              Utility.formatIndianCurrency(diamond.amount ?? 0),
                            ];
                          }).toList(),
                      totalRow: [
                        "",
                        "",
                        productDetail?.diamondpcs?.toString() ?? "0",
                        productDetail?.diamondcts ?? "0",
                        "",
                        Utility.formatIndianCurrency(
                          double.tryParse(
                                productDetail?.diamondamount ?? "0",
                              ) ??
                              0,
                        ),
                      ],
                      // rows: const [
                      //   ["Gold", "0.010-0.110", "2", "0.190", "17800", "3382"],
                      //   ["Round", "0.010-0.110", "2", "0.220", "17800", "3382"],
                      //   ["MOP", "0.010-0.110", "6", "0.220", "17800", "3382"],
                      //   ["Marquise", "+6-11", "60", "0.220", "17800", "3382"],
                      //   ["Round", "+6-11", "10", "0.220", "17800", "3382"],
                      // ],
                      // totalRow: const ["", "", "80", "0.220", "", "16910"],
                    ),

                    // Stone Details
                    if ((productDetail?.stonecomponents ?? []).isNotEmpty)
                      DetailsExpansion(
                        title: "Stone Details",
                        header: const ["Code", "Weight", "Rate", "Amount"],
                        rows:
                            (productDetail?.stonecomponents ?? []).map((stone) {
                              return [
                                (stone.type ?? "").toString(),
                                (stone.weight?.toString() ?? "0").toString(),
                                Utility.formatIndianCurrency(
                                  stone.rate ?? 0,
                                ).toString(),
                                Utility.formatIndianCurrency(
                                  stone.amount ?? 0,
                                ).toString(),
                              ];
                            }).toList(),
                        totalRow: [
                          "",
                          (productDetail?.stoneweight ?? "0").toString(),
                          "",
                          Utility.formatIndianCurrency(
                            double.tryParse(
                                  productDetail?.stoneamount ?? "0",
                                ) ??
                                0,
                          ).toString(),
                        ],
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
                    if ((productDetail?.makingcomponents ?? []).isNotEmpty)
                      DetailsExpansion(
                        title: "Making Details",
                        header: const ["Rate", "Amount"],
                        rows:
                            (productDetail?.makingcomponents ?? []).map((
                              making,
                            ) {
                              return [
                                Utility.formatIndianCurrency(making.rate ?? 0),
                                Utility.formatIndianCurrency(
                                  making.amount ?? 0,
                                ),
                              ];
                            }).toList(),
                        totalRow: [
                          "",
                          Utility.formatIndianCurrency(
                            double.tryParse(
                                  productDetail?.makingcharges ?? "0",
                                ) ??
                                0,
                          ),
                        ],
                        // rows: const [
                        //   ["1700", "1600"],
                        // ],
                        // totalRow: const ["", "1600"],
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
                                    value: option.name,
                                    child: Text(option.name ?? ''),
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
                              child: Row(
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
                                  Container(
                                    width: 1.5,
                                    color: ColorsValue.color94A3B8,
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

                    const SizedBox(height: 20),

                    Padding(
                      padding: Dimens.edgeInsets20_00_20_00.copyWith(
                        bottom: 10,
                        left: 0,
                        right: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                Get.back();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height:
                                    Utility.isTablet()
                                        ? Dimens.fiftyFive
                                        : Dimens.fourty,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: ColorsValue.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                    Dimens.ten,
                                  ),
                                  border: Border.all(
                                    color: ColorsValue.blackColor,
                                    width: Dimens.one,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(AssetConstants.scanner),
                                    Dimens.boxWidth5,
                                    Text(
                                      'Scane New'.tr,
                                      style: Styles.txtBlackColorW50014
                                          .copyWith(
                                            fontSize:
                                                Utility.isTablet()
                                                    ? Dimens.twenty
                                                    : Dimens.fourteen,
                                            color: ColorsValue.blackColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Dimens.boxWidth20,
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                RouteManagement.goToCartScreen();
                                // await dbHelper.insertProduct(element);
                                // await ProductDBManager.instance.insert(element);
                                // RouteManagement.goToAddNewCustomerScreen();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height:
                                    Utility.isTablet()
                                        ? Dimens.fiftyFive
                                        : Dimens.fourty,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: ColorsValue.appColor,
                                  borderRadius: BorderRadius.circular(
                                    Dimens.ten,
                                  ),
                                ),
                                child: Text(
                                  'Add To Cart',
                                  style: Styles.whiteColorW50014.copyWith(
                                    fontSize:
                                        Utility.isTablet()
                                            ? Dimens.twenty
                                            : Dimens.fourteen,
                                  ),
                                ),
                              ),
                            ),
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    const TextSpan(text: '  '),
                    TextSpan(
                      text: price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFF2C3E50)
                          : const Color(0xFFBDBDBD),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
                color:
                    isSelected ? const Color(0xFF2C3E50) : Colors.transparent,
              ),
              child:
                  isSelected
                      ? const Icon(Icons.check, color: Colors.white, size: 16)
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
