import 'package:a_nxt/app/pages/sales_analytics/sales_analytics_page.dart';
import 'package:a_nxt/app/theme/colors_value.dart';
import 'package:a_nxt/app/theme/dimens.dart';
import 'package:a_nxt/app/theme/styles.dart';
import 'package:a_nxt/app/widgets/app_bar_widgets.dart';
import 'package:a_nxt/app/widgets/custom_text_form_field.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class CartItem {
//   final String jobNo;
//   final String quality;
//   final int nw;
//   final int amount;
//   final String designNo;
//   final String imageUrl;
//   int quantity;
//   int totalAmount;

//   CartItem({
//     required this.jobNo,
//     required this.quality,
//     required this.nw,
//     required this.amount,
//     required this.quantity,
//     required this.totalAmount,
//     required this.designNo,
//     required this.imageUrl,
//   });
// }

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) {
        final orderId = Get.arguments;
        final controller = Get.find<SalesAnalyticsController>();
        controller.postGetOneCart(orderId: orderId);
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Cart",
            isCenter: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Cart Items
                          Container(
                            color: ColorsValue.whiteColor,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller
                                      .getOneCartData
                                      ?.items
                                      ?.length, // controller.cartItems.length,
                              itemBuilder: (context, index) {
                                final item =
                                    controller.getOneCartData?.items?[index];
                                return CartProductCard(
                                  designNo: item?.jobno ?? "",
                                  imageUrl: item?.image ?? '',
                                  nw:
                                      int.tryParse(
                                        item?.calculation?.summary?.netweight ??
                                            '',
                                      ) ??
                                      0,
                                  amount:
                                      item?.calculation?.summary?.totalamount ??
                                      '',
                                  totalAmount:
                                      item?.calculation?.summary?.totalamount ??
                                      '',
                                  quality:
                                      item?.calculation?.summary?.quantity
                                          .toString() ??
                                      '',
                                  jobNo: item?.jobno ?? '',
                                  count: item?.quantity ?? 0,
                                  onIncrease:
                                      () => controller.updateQuantity(
                                        item?.quantity ?? 0,
                                        1,
                                      ),
                                  onDecrease:
                                      () => controller.updateQuantity(
                                        item?.quantity ?? 0,
                                        -1,
                                      ),
                                  onRemove:
                                      () => controller.removeItem(
                                        jobNo: item?.jobno ?? '',
                                      ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Discount Section
                          Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const Text(
                                //   'Discount',
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w600,
                                //     color: Colors.black87,
                                //   ),
                                // ),
                                // const SizedBox(height: 12),
                                CustomTextFormField(
                                  controller: controller.nameController,
                                  isTitle: true,
                                  titleStyle: Styles.txtBlackColorW70014,
                                  hintStyle: Styles.txtGreyColorW50012,
                                  hintText: 'Enter Discount'.tr,
                                  title: 'Discount'.tr,
                                  fillColor: ColorsValue.textFieldBg,
                                  filled: true,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'com.pure.pureyou'.tr;
                                    }
                                    return null;
                                  },
                                  suffixIcon: Text("data"),

                                  prefixIcon: Padding(
                                    padding: Dimens.edgeInsetsLeft2,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Dimens.eight,
                                        vertical: Dimens.ten,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Dimens.six,
                                        ),
                                        border: Border.all(
                                          color: ColorsValue.greenColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Dimens.twelve,
                                              vertical: Dimens.eight,
                                            ),
                                            child: Text(
                                              controller.discount == "dol"
                                                  ? "\₹"
                                                  : "%",
                                              style: Styles.txtBlackColorW70016,
                                            ),
                                          ),
                                          Container(
                                            height: Dimens.twentyFour,
                                            width: 1,
                                            color: ColorsValue.greenColor,
                                          ),
                                          PopupMenuButton<String>(
                                            offset: Offset(0, 35),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    Dimens.eight,
                                                  ),
                                            ),
                                            itemBuilder:
                                                (BuildContext context) => [
                                                  PopupMenuItem<String>(
                                                    value: 'dol',
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "\₹",
                                                          style:
                                                              Styles
                                                                  .txtBlackColorW70014,
                                                        ),
                                                        SizedBox(
                                                          width: Dimens.twelve,
                                                        ),
                                                        Text(
                                                          'Rupees'.tr,
                                                          style:
                                                              Styles
                                                                  .txtBlackColorW70014,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  PopupMenuItem<String>(
                                                    value: 'per',
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "%",
                                                          style:
                                                              Styles
                                                                  .txtBlackColorW70014,
                                                        ),
                                                        SizedBox(
                                                          width: Dimens.twelve,
                                                        ),
                                                        Text(
                                                          'Percentage'.tr,
                                                          style:
                                                              Styles
                                                                  .txtBlackColorW70014,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                            onSelected: (String value) {
                                              controller.discount = value;
                                              controller.update();
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: Dimens.ten,
                                                vertical: Dimens.eight,
                                              ),
                                              child: Icon(
                                                Icons.expand_more,
                                                color:
                                                    ColorsValue.txtBlackColor,
                                                size: Dimens.twenty,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // suffixIcon: Padding(
                                  //   padding: Dimens.edgeInsetsRight10,
                                  //   child: CustomButton(
                                  //     onPressed: () {},
                                  //     text: 'Apply',
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Product Summary
                          Container(
                            color: ColorsValue.textFieldBg,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      controller.productSummaryExpanded =
                                          !controller.productSummaryExpanded;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Product Summary',
                                          style: Styles.txtBlackColorW60014,
                                          // TextStyle(
                                          //   fontWeight: FontWeight.w600,
                                          //   fontSize: 14,
                                          // ),
                                        ),
                                        Icon(
                                          controller.productSummaryExpanded
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (controller.productSummaryExpanded) ...[
                                  Divider(
                                    height: 1,
                                    color: ColorsValue.greyCBD5E1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        _buildRow('Product', 'Qta'),
                                        Divider(
                                          height: 1,
                                          color: ColorsValue.greyCBD5E1,
                                        ),
                                        Dimens.boxHeight5,
                                        _buildRow('Ladies Ring', '2'),
                                        _buildRow('Pendent', '3'),
                                        _buildRow('Bracelet', '4'),
                                        DottedLine(
                                          dashColor: ColorsValue.greyCBD5E1,
                                          lineThickness: 2,
                                          dashGapLength: 4,
                                          dashGapRadius: 20,
                                        ),
                                        Dimens.boxHeight5,

                                        _buildRow(
                                          'Total Item',
                                          '9',
                                          isBold: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Invoice Summary
                          Container(
                            color: ColorsValue.textFieldBg,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      controller.invoiceSummaryExpanded =
                                          !controller.invoiceSummaryExpanded;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Invoice Summary',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Icon(
                                          controller.invoiceSummaryExpanded
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (controller.invoiceSummaryExpanded) ...[
                                  const Divider(height: 1),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        _buildRow('Gold Rate', '0.00'),
                                        _buildRow('G.W', '56.570 gm'),
                                        _buildRow('N.W', '49.008 gm'),
                                        _buildRow('Fine', '37.729 gm'),
                                        _buildRow('Less', '602 x 35.341 gm'),
                                        _buildRow('S.W', '24.803 cts'),
                                        _buildRow('Rs', '75'),
                                        _buildRow('Diamond', '₹218528'),
                                        _buildRow('Stone', '₹44231'),
                                        _buildRow('Hubb Charges', '672'),
                                        _buildRow('GST 3%', '₹7839'),
                                        DottedLine(
                                          dashColor: ColorsValue.greyCBD5E1,
                                          lineThickness: 2,
                                          dashGapLength: 4,
                                          dashGapRadius: 20,
                                        ),
                                        Dimens.boxHeight5,
                                        _buildRow(
                                          'Discount',
                                          '10%',
                                          isBold: true,
                                        ),
                                        DottedLine(
                                          dashColor: ColorsValue.greyCBD5E1,
                                          lineThickness: 2,
                                          dashGapLength: 4,
                                          dashGapRadius: 20,
                                        ),
                                        Dimens.boxHeight5,
                                        _buildRow(
                                          'Total',
                                          '₹22,27,076',
                                          isBold: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(
                              16,
                            ).copyWith(right: 0, left: 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD4A574),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Order Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Order Now Button
                ],
              ),
            ),
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
                    ? Styles.txtBlackColorW60014
                    : Styles.txtBlackColorW50014,
          ),
          Text(
            value,
            style:
                isBold
                    ? Styles.txtBlackColorW60014
                    : Styles.txtBlackColorW50014,
          ),
        ],
      ),
    );
  }

  // Widget _buildInvoiceRow(String label, String value, {bool isBold = false}) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           label,
  //           style: TextStyle(
  //             fontSize: 13,
  //             fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
  //             color: isBold ? Colors.black : Colors.grey[700],
  //           ),
  //         ),
  //         Text(
  //           value,
  //           style: TextStyle(
  //             fontSize: 13,
  //             fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class CartProductCard extends StatelessWidget {
  final String jobNo;
  final String quality;
  final int nw;
  final String imageUrl;
  final String amount;
  final String totalAmount;
  final int count;
  final String designNo;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartProductCard({
    super.key,
    required this.designNo,
    required this.imageUrl,
    required this.nw,
    required this.amount,
    required this.totalAmount,
    required this.quality,
    required this.jobNo,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.edgeInsets6,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: ColorsValue.textFieldBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsValue.greyCBD5E1, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 110,
                  height: 110,
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    child: Text(
                      designNo,
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
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _labelValue("Job No. ", jobNo),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, top: 4),
                      child: GestureDetector(
                        onTap: onRemove,
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_outline,
                              size: 22,
                              color: ColorsValue.redColor,
                            ),
                            SizedBox(width: 3),
                            Text('Remove', style: Styles.redColorW70014),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight6,
                _labelValue("Quality ", quality),
                Dimens.boxHeight4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _labelValue("N.W ", nw.toString()),
                        Dimens.boxHeight4,
                        _labelValue("Amount ", amount),
                      ],
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          // Minus Button
                          InkWell(
                            onTap: onDecrease,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color:
                                    count > 1
                                        ? const Color(0xFF2C3E50)
                                        : Colors.grey[400],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 14,
                                color:
                                    count > 1 ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                          // Count Display
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              count.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          // Plus Button
                          InkWell(
                            onTap: onIncrease,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFF2C3E50,
                                ), // Always dark blue
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight4,
                _labelValue("T. Amount ", totalAmount),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _labelValue(String label, String value) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      text: TextSpan(
        text: "$label :- ",
        style: TextStyle(
          fontSize: 14,
          color: ColorsValue.txtBlackColor,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 14,
              color: ColorsValue.lineColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
