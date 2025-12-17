import 'package:a_nxt/app/theme/colors_value.dart';
import 'package:a_nxt/app/theme/dimens.dart';
import 'package:a_nxt/app/theme/styles.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String jobNo;
  final String quality;
  final int nw;
  final int amount;
  final String designNo;
  final String imageUrl;
  int quantity;
  int totalAmount;

  CartItem({
    required this.jobNo,
    required this.quality,
    required this.nw,
    required this.amount,
    required this.quantity,
    required this.totalAmount,
    required this.designNo,
    required this.imageUrl,
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String _selectedCurrency = '₹';
  final TextEditingController _discountController = TextEditingController();
  bool _productSummaryExpanded = true;
  bool _invoiceSummaryExpanded = true;
  bool _discountChecked = false;

  List<CartItem> cartItems = [
    CartItem(
      jobNo: '175987',
      quality: '14 KT',
      nw: 120,
      amount: 165000,
      quantity: 1,
      totalAmount: 165000,
      designNo: '',
      imageUrl:
          'https://thrivenextgen.com/wp-content/uploads/AdobeStock_162765779_45-scaled.webp',
    ),
    CartItem(
      jobNo: '175987',
      quality: '15 KT',
      nw: 120,
      amount: 165000,
      quantity: 2,
      totalAmount: 165000,
      designNo: '',
      imageUrl:
          'https://thrivenextgen.com/wp-content/uploads/AdobeStock_162765779_45-scaled.webp',
    ),
    CartItem(
      jobNo: '175987',
      quality: '16 KT',
      nw: 120,
      amount: 165000,
      quantity: 12,
      totalAmount: 1980000,
      designNo: '',
      imageUrl:
          'https://thrivenextgen.com/wp-content/uploads/AdobeStock_162765779_45-scaled.webp',
    ),
  ];

  void _updateQuantity(int index, int delta) {
    setState(() {
      if (cartItems[index].quantity + delta > 0) {
        cartItems[index].quantity += delta;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsValue.whiteColor,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
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
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            return CartProductCard(
                              designNo: item.jobNo,
                              imageUrl: item.imageUrl,
                              nw: item.nw,
                              amount: item.amount.toString(),
                              totalAmount: item.totalAmount.toString(),
                              quality: item.quality.toString(),
                              jobNo: item.jobNo,
                              count: item.quantity,
                              onIncrease: () => _updateQuantity(index, 1),
                              onDecrease: () => _updateQuantity(index, -1),
                              onRemove: () => _removeItem(index),
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
                            const Text(
                              'Discount',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    child: Row(
                                      children: [
                                        // Currency Dropdown
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey[300]!,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: DropdownButton<String>(
                                            value: _selectedCurrency,
                                            underline: const SizedBox(),
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 20,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            items:
                                                ['₹', '\$', '€', '£'].map((
                                                  String value,
                                                ) {
                                                  return DropdownMenuItem<
                                                    String
                                                  >(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                _selectedCurrency =
                                                    newValue ?? '₹';
                                              });
                                            },
                                          ),
                                        ),
                                        // Vertical Divider is handled by border above
                                        // Text Field
                                        Expanded(
                                          child: TextField(
                                            controller: _discountController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              hintText: 'Enter Discount',
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 12,
                                                  ),
                                            ),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                // Apply Button
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle apply discount
                                    if (_discountController.text.isNotEmpty) {
                                      // Apply discount logic here
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(
                                      0xFF2C3E50,
                                    ), // Dark blue-grey
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Apply',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
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
                                  _productSummaryExpanded =
                                      !_productSummaryExpanded;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Product Summary',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Icon(
                                      _productSummaryExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (_productSummaryExpanded) ...[
                              const Divider(height: 1),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    _buildSummaryRow('Product', '2', true),
                                    _buildSummaryRow('Ladies Ring', '2', false),
                                    _buildSummaryRow('Pendent', '3', false),
                                    _buildSummaryRow('Bracelet', '4', false),
                                    const Divider(height: 20),
                                    _buildSummaryRow('Total Item', '9', true),
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
                                  _invoiceSummaryExpanded =
                                      !_invoiceSummaryExpanded;
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
                                      _invoiceSummaryExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (_invoiceSummaryExpanded) ...[
                              const Divider(height: 1),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    _buildInvoiceRow('Gold Rate', '0.00'),
                                    _buildInvoiceRow('G.W', '56.570 gm'),
                                    _buildInvoiceRow('N.W', '49.008 gm'),
                                    _buildInvoiceRow('Fine', '37.729 gm'),
                                    _buildInvoiceRow('Less', '602 x 35.341 gm'),
                                    _buildInvoiceRow('S.W', '24.803 cts'),
                                    _buildInvoiceRow('Rs', '75'),
                                    _buildInvoiceRow('Diamond', '₹218528'),
                                    _buildInvoiceRow('Stone', '₹44231'),
                                    _buildInvoiceRow('Hubb Charges', '672'),
                                    _buildInvoiceRow('GST 3%', '₹7839'),
                                    const Divider(height: 20),
                                    _buildInvoiceRow('Discount', '10%'),
                                    const Divider(height: 20),
                                    _buildInvoiceRow(
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
                              padding: const EdgeInsets.symmetric(vertical: 16),
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
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, bool isBold) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
              color: isBold ? Colors.black : Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
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
