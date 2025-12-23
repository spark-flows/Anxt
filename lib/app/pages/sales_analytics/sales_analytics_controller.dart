import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/app/pages/sales_analytics/screens/newFlow/cart_screen.dart';
import 'package:a_nxt/app/widgets/custom_listtileView.dart';
import 'package:a_nxt/data/data.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/add_to_cart_model.dart';
import 'package:a_nxt/domain/models/create_customer_model.dart';
import 'package:a_nxt/domain/models/getAll_product_model.dart';
import 'package:a_nxt/domain/models/get_one_cart_model.dart';
import 'package:a_nxt/domain/models/priceMaster_model.dart';
import 'package:a_nxt/domain/models/product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SalesAnalyticsController extends GetxController {
  SalesAnalyticsController(this.salesAnalyticsPresenter);

  final SalesAnalyticsPresenter salesAnalyticsPresenter;

  void initCustomer({GetOneUserData? customer}) {
    if (customer != null) {
      nameController.text = customer.name!;
      mobileController.text = customer.mobile!;
      emailController.text = customer.email!;
      adressController.text = customer.address!;
      stateController.text = customer.state!;
      cityController.text = customer.city!;
      areaController.text = customer.area!;
      zipCodeController.text = customer.zipcode!;
    } else {
      nameController.clear();
      mobileController.clear();
      emailController.clear();
      adressController.clear();
      stateController.clear();
      cityController.clear();
      areaController.clear();
      zipCodeController.clear();
    }
  }

  int filterOnboardValue = 0;
  // List<String> filterOnboardType = ['Date'];

  TextEditingController fromOnboardController = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );
  TextEditingController toOnboardController = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );

  DateTime fromOnboardDate = DateTime.now();
  DateTime toOnboardDate = DateTime.now();

  ProductListDoc? selectProduct;
  DateTime? nextDate;
  TextEditingController nextDateController = TextEditingController();

  GlobalKey<FormState> salesKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  TextEditingController jobNoController = TextEditingController();

  int pageCount = 1;
  bool isLastPage = false;
  bool isLoading = false;
  List<GetAllUsesDoc> getAllUserList = [];
  final ScrollController scrollController = ScrollController();

  Future<void> postAllUserList(
    int pageKey, {
    String? salesPersonId,
    String? fromDate,
    String? toDate,
  }) async {
    if (pageKey == 1) {
      pageCount = 1;
    }
    isLoading = true;
    var response = await salesAnalyticsPresenter.postAllUserList(
      page: pageKey,
      limit: 1000,
      search: SearchModel(),
      salesPersonId: salesPersonId ?? "",
      fromDate: fromDate ?? '',
      toDate: toDate ?? '',
      isLoading: false,
    );
    getAllUserList.clear();
    if (response?.data != null) {
      isLoading = false;
      if (pageKey == 1) {
        isLastPage = false;
        getAllUserList.clear();
      }
      if ((response?.data?.docs?.length ?? 0) < 20) {
        isLastPage = true;
        getAllUserList.addAll(response?.data?.docs ?? []);
      } else {
        pageCount++;
        getAllUserList.addAll(response?.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollController.positions.isNotEmpty) {
          scrollController.jumpTo(0);
        }
      }
    } else {
      isLoading = false;
      Utility.errorMessage(
        response?.message ?? 'Getting error while fetching data',
      );
    }
    update();
  }

  List<String> filterList = ['Date'];

  GetOneUserData? getOneUser;
  bool isGetOneUserLoading = false;

  Future<void> postGetOneUser({required String salesid}) async {
    isGetOneUserLoading = true;
    var response = await salesAnalyticsPresenter.postGetOneUser(
      isLoading: true,
      salesid: salesid,
    );
    getOneUser = null;
    if (response?.status == 200) {
      getOneUser = response?.data;
      isGetOneUserLoading = false;
      productList =
          response?.data?.sales?.first.product
              ?.map(
                (e) => ProductModel(
                  productName: e.product?.productname ?? "",
                  productID: e.product?.id ?? "",
                  weight: e.weight,
                ),
              )
              .toList() ??
          [];
      postGetProductList();
    } else {
      isGetOneUserLoading = false;
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  List<ProductListDoc> getProductList = [];
  bool isGetProductListLoading = false;

  Future<void> postGetProductList() async {
    isGetProductListLoading = true;
    var response = await salesAnalyticsPresenter.postGetProductList(
      isLoading: true,
      category: '',
      page: 1,
      limit: 20,
      max: '',
      min: '',
      search: '',
    );
    getProductList.clear();
    if (response?.status == 200) {
      getProductList = response?.data.docs ?? [];
      isGetProductListLoading = false;
    } else {
      isGetProductListLoading = false;
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  //// Create New Customer ///

  TextEditingController weightController = TextEditingController();
  List<ProductModel> productList = [];

  List<String> piliStatus = ['0-50', '50-80', '80-100'];
  String? selectPiliStatus;

  List<String> statusList = ['Sale', 'Cancelled', 'pili'];
  String? selectStatus;

  CreateCustomerData? customerDetail;

  Future<void> postCreateCustomer({String? customerId}) async {
    var response = await salesAnalyticsPresenter.postCreateCustomer(
      isLoading: true,
      salesperson: getOneUser?.sales?.first.salesperson?.id ?? '',
      customerId: customerId ?? '',
      name: nameController.text,
      mobile: mobileController.text,
      email: emailController.text,
      address: adressController.text,
      state: stateController.text,
      city: cityController.text,
      area: areaController.text,
      zipcode: zipCodeController.text,
      ownername: '',
      ownermobile: '',
      managername: '',
      managermobile: '',
    );
    customerDetail = null;
    if (response?.status == 200) {
      customerDetail = response?.data;
      Get.back();
      Utility.getRawSnackBar(response?.message ?? "", ColorsValue.appColor);
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  Future<void> postSalesCreate({
    DateTime? storeInDate,
    DateTime? storeOutDate,
    String mode = 'all',
  }) async {
    final storeDate =
        storeInDate != null ? DateFormat('hh:mma').format(storeInDate) : '';
    final storeOut =
        storeOutDate != null ? DateFormat('hh:mma').format(storeOutDate) : '';

    final Map<String, dynamic> body = {};

    List<AddProductModel> addProductList =
        productList
            .map(
              (product) => AddProductModel(
                productID: product.productID,
                weight: product.weight,
              ),
            )
            .toList();

    final totalWeight = productList.fold<num>(
      0,
      (previousValue, element) => previousValue + element.weight,
    );

    body.addAll({
      'storeIn': storeDate,
      'storeOut': storeOut,
      'customerId': getOneUser?.id ?? '',
      'salesPersonId': getOneUser?.sales?.first.salesperson?.id ?? '',
      'product': addProductList,
      'nextDate':
          nextDate != null ? DateFormat('yyyy-MM-dd').format(nextDate!) : '',
      'status': selectStatus ?? '',
      'piliStatus': selectPiliStatus ?? '',
      'weight': totalWeight.toString(),
      'duration': '',
      'customerNeeds': '',
      'nextPurchase': '',
      'customerReason': '',
      'customerFeedback': '',
      'customerCategory': '',
    });

    var response = await salesAnalyticsPresenter.postSalesCreate(
      isLoading: true,
      salesId: getOneUser?.sales?.first.id ?? '',
      customerId: body['customerId'] ?? '',
      salesPersonId: body['salesPersonId'],
      // getOneUser?.sales?.first.salesperson?.id ?? '',
      product: body['product'],
      // productList,
      nextDate: body['nextDate'],
      storeIn: body['storeIn'] ?? '',
      storeOut: body['storeOut'] ?? '',
      status: body['status'] ?? '',
      piliStatus: body['piliStatus'] ?? '',
      weight: body['weight'] ?? '',
      duration: body['duration'] ?? '',
      customerNeeds: body['customerNeeds'] ?? '',
      nextPurchase: body['nextPurchase'] ?? '',
      customerReason: body['customerReason'] ?? '',
      customerFeedback: body['customerFeedback'] ?? '',
      customerCategory: body['customerCategory'] ?? '',
    );
    if (response?.status == 200) {
      if (mode != "all") {
        Utility.snacBar(
          "${capitalizeFirstLetter(mode)} Successfully",
          ColorsValue.appColorEBBD87,
        );
      } else {
        Utility.snacBar(
          response?.message ?? "Success",
          ColorsValue.appColorEBBD87,
        );
        selectStatus = null;
        selectPiliStatus = null;
        nextDateController.clear();
        nextDate = DateTime.now();
        productList.clear();
        RouteManagement.goToSalesAnalyticsListScreen();
      }
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  ////// New Flow ///

  final List<MetalDetail> metalList = [
    MetalDetail(
      code: "G14KTR",
      gw: 6.381,
      nw: 6.220,
      purity: 74.00,
      fine: 4.603,
      rate: 7450,
    ),
    MetalDetail(
      code: "G18K",
      gw: 3.250,
      nw: 3.100,
      purity: 75.00,
      fine: 2.325,
      rate: 8200,
    ),
    MetalDetail(
      code: "G22K",
      gw: 2.150,
      nw: 2.050,
      purity: 91.60,
      fine: 1.878,
      rate: 9100,
    ),
  ];

  bool is18KSelected = false;
  bool is14KSelected = false;

  double calculateTotal(double baseTotal, double rate18kt, double rate14kt) {
    double total = baseTotal;

    if (is18KSelected) {
      total += rate18kt;
    }
    if (is14KSelected) {
      total += rate14kt;
    }

    return total;
  }

  String discount = "dol";

  String selectedCurrency = '₹';
  final TextEditingController discountController = TextEditingController();
  bool productSummaryExpanded = true;
  bool invoiceSummaryExpanded = true;
  bool discountChecked = false;

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

  void updateQuantity(int quantity, int delta) {
    if (quantity + delta > 0) {
      quantity += delta;
    }
    update();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    update();
  }

  ProductDetailData? oneProductDetail;

  Future<void> getScaneData({
    required String jobNo,
    GetOneUserData? customerId,
  }) async {
    var response = await salesAnalyticsPresenter.getScaneData(
      isLoading: false,
      jobNo: jobNo,
      pricemasternameId: 'cbf675c0-8e43-4555-a9b8-d8f33928989b',
    );
    oneProductDetail = null;
    if (response?.data != null) {
      oneProductDetail = response?.data;
      if (oneProductDetail != null) {
        RouteManagement.goToProductDetailScreen(
          productDetail: oneProductDetail!,
          customerDetail: customerId,
        );
      }
      Utility.closeLoader();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  List<PriceMasterListDoc> paymentMasterList = [];
  PriceMasterListData? priceMasterListData;
  PriceMasterListDoc? paymentMaster;
  bool showPriceMasterError = false;

  Future<void> postPriceMasterList() async {
    var response = await salesAnalyticsPresenter.postPriceMasterList(
      isLoading: false,
      page: 1,
      limit: 30,
    );
    paymentMasterList.clear();
    if (response?.data != null) {
      paymentMasterList.addAll(response?.data?.docs ?? []);
      Utility.closeLoader();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  AddToCartData? addToCartData;

  Future<void> postAddToCart({
    required String jobNo,
    required String customerId,
    required String pricemasternameid,
  }) async {
    var response = await salesAnalyticsPresenter.postAddToCart(
      isLoading: false,
      cartId: '',
      jobNo: jobNo,
      customerid: customerId,
      salesmanid: getOneUser?.sales?.first.salesperson?.id ?? "",
      salesid: '',
      salesexecutiveid: '',
      pricemasternameid: pricemasternameid,
      diamondrates: '',
      makingrate: '',
      stonerate: '',
    );
    addToCartData = null;
    if (response?.data != null) {
      addToCartData = response?.data;
      RouteManagement.goToCartScreen(orderId: addToCartData?.id ?? "");
      Utility.closeLoader();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  GetOneCartData? getOneCartData;

  Future<void> postGetOneCart({required String orderId}) async {
    var response = await salesAnalyticsPresenter.postGetOneCart(
      isLoading: false,
      orderId: orderId,
    );
    getOneCartData = null;
    if (response?.data != null) {
      getOneCartData = response?.data;
      Utility.closeLoader();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

class ProductModel {
  ProductModel({
    required this.productName,
    required this.productID,
    required this.weight,
  });

  String productName;
  String productID;
  num weight;
}
