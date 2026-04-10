import 'dart:async';
import 'dart:convert';

import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/data/data.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/add_to_cart_model.dart';
import 'package:a_nxt/domain/models/create_customer_model.dart';
import 'package:a_nxt/domain/models/getAll_product_model.dart';
import 'package:a_nxt/domain/models/get_one_cart_model.dart';
import 'package:a_nxt/domain/models/priceMaster_model.dart';
import 'package:a_nxt/domain/models/product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class SalesAnalyticsController extends GetxController {
  SalesAnalyticsController(this.salesAnalyticsPresenter);

  final SalesAnalyticsPresenter salesAnalyticsPresenter;

  void initCustomer({GetOneUserData? customer}) {
    // if (customer != null) {
    //   nameController.text = customer.name!;
    //   mobileController.text = customer.mobile!;
    //   emailController.text = customer.email!;
    //   adressController.text = customer.address!;
    //   stateController.text = customer.state!;
    //   cityController.text = customer.city!;
    //   areaController.text = customer.area!;
    //   zipCodeController.text = customer.zipcode!;
    // } else {
    //   nameController.clear();
    //   mobileController.clear();
    //   emailController.clear();
    //   adressController.clear();
    //   stateController.clear();
    //   cityController.clear();
    //   areaController.clear();
    //   zipCodeController.clear();
    // }
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

  TextEditingController jobNoController = TextEditingController();

  PagingController<int, SalesListDoc> customerPagingController =
      PagingController(firstPageKey: 1);

  List<SalesListDoc> customersDocList = [];

  int filterInterValue = 0;
  List<String> filterInterType = ['Date'];

  Future<void> postSalesList(pageKey) async {
    var response = await salesAnalyticsPresenter.postSalesList(
      page: pageKey,
      limit: 15,
      fromDate:
          fromOnboardController.text.isNotEmpty
              ? DateFormat(
                "yyyy-MM-dd",
              ).format(DateTime.parse(fromOnboardController.text))
              : DateFormat("yyyy-MM-dd").format(DateTime.now()),
      todate:
          toOnboardController.text.isNotEmpty
              ? DateFormat(
                "yyyy-MM-dd",
              ).format(DateTime.parse(toOnboardController.text))
              : DateFormat("yyyy-MM-dd").format(DateTime.now()),
      isLoading: true,
    );
    if (response?.data != null) {
      if (pageKey == 1) {
        customersDocList.clear();
        customerPagingController.itemList?.clear();
      }
      customersDocList = response?.data?.docs ?? [];

      final isLastPage = customersDocList.length < 15;
      if (isLastPage) {
        customerPagingController.appendLastPage(customersDocList);
      } else {
        var nextPageKey = pageKey + 1;
        customerPagingController.appendPage(customersDocList, nextPageKey);
      }
      update();
    }
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

  GlobalKey<FormState> salesKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();

  TextEditingController ownernameController = TextEditingController();
  TextEditingController ownermobileController = TextEditingController();
  TextEditingController managernameController = TextEditingController();
  TextEditingController managermobileController = TextEditingController();

  String? selectCustomerCate;

  List<String> categoriesList = ['1', '2', '3'];

  String dialCode = "91";
  bool isValid = false;

  String dialOwnerCode = "91";
  bool isOwnerValid = false;

  String dialManagerCode = "91";
  bool isManagerValid = false;

  Future<void> postCreateCustomer() async {
    var response = await salesAnalyticsPresenter.postCreateCustomer(
      customerid: "",
      salesperson: Get.find<Repository>().getStringValue(
        LocalKeys.salesPersonId,
      ),
      name: nameController.text,
      countrycode: dialCode,
      mobile: mobileController.text,
      email: emailController.text,
      address: addressController.text,
      state: stateController.text,
      city: cityController.text,
      area: areaController.text,
      zipcode: zipcodeController.text,
      ownername: ownernameController.text,
      ownermobile: ownermobileController.text,
      managername: managernameController.text,
      managermobile: managermobileController.text,
      custcategory: selectCustomerCate,
      isLoading: true,
    );
    customerDetail = null;
    if (response?.statusCode == 200) {
      Get.back();
      postSalesList(1);
    } else {
      Utility.errorMessage(
        jsonDecode(response?.data.toString() ?? "")['Message'],
      );
    }
    update();
  }

  List<CustomerListData> customerList = [];

  Future<void> postCustomerList() async {
    var response = await salesAnalyticsPresenter.postCustomerList(
      isLoading: true,
    );
    customerList.clear();
    if (response?.data != null) {
      customerList = response?.data ?? [];
      update();
    }
  }

  Future<void> postCustomerAsssign() async {
    var response = await salesAnalyticsPresenter.postCustomerAsssign(
      categoryid:
          customerList
              .where((e) {
                return e.checkbox == true;
              })
              .map((e) => e.id ?? "")
              .toList(),
      salesperson: Get.find<Repository>().getStringValue(
        LocalKeys.salesPersonId,
      ),
      isLoading: false,
    );
    if (response?.data != null) {
      customerPagingController.refresh();
      Get.back();
      update();
    }
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
      'customerFeedback': remarkController.text,
      'customerCategory': '',
      'location': Utility.currentLocation,
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
      location: body['location'] ?? '',
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

  GlobalKey<FormState> remarkKey = GlobalKey<FormState>();
  TextEditingController remarkController = TextEditingController();

  showRemarkModel(BuildContext context, bool isStore) {
    remarkController.clear();
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: ColorsValue.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.thirty),
          topRight: Radius.circular(Dimens.thirty),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom, // 🔥 KEY FIX
          ),
          child: Form(
            key: remarkKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isStore ? "Store In Remark" : "Store Out Remark",
                      style: Styles.txtBlackColorW70018,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(AssetConstants.ic_close),
                    ),
                  ],
                ),
                Dimens.boxHeight10,
                CustomTextFormField(
                  controller: remarkController,
                  isTitle: true,
                  title: "Remark",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Remark',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomButton(
                  onPressed: () {
                    if (remarkKey.currentState!.validate()) {
                      Get.back();
                      postSalesCreate(
                        storeOutDate: DateTime.now(),
                        mode: 'storeOut',
                      );
                      update();
                    }
                  },
                  text: isStore ? 'Store In' : 'Store Out',
                  heightBtn: Dimens.fifty,
                  backgroundColor: ColorsValue.appColor,
                  textStyle: Styles.whiteColorW50014,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ////// New Flow ///

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

  void updateQuantity(int quantity, int delta) {
    if (quantity + delta > 0) {
      quantity += delta;
    }
    update();
  }

  Future<void> removeItem({required String jobNo}) async {
    var response = await salesAnalyticsPresenter.postRemoveCart(
      isLoading: false,
      jobNo: jobNo,
    );
    oneProductDetail = null;
    if (response?.data != null) {
      Utility.getRawSnackBar(response?.message ?? "", ColorsValue.appColor);
      postGetOneCart(orderId: response?.data?.id ?? "");
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
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

  /// ==================================== MApScreen ================================

  GoogleMapController? mapSelectController;
  LatLng? selectedLocation;
  LatLng? mapPosition;

  Future<void> onMapTapped(LatLng latLng) async {
    selectedLocation = latLng;
    update();
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        addressController.text =
            "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
        debugPrint("Location:$place");
        mapSelectController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(latLng.latitude, latLng.longitude),
              zoom: 11,
            ),
          ),
        );
        update();
      }
    } catch (e) {
      print("Error getting address: $e");
    }
  }

  String? locationAddress;

  @override
  onInit() {
    super.onInit();
    getCurrentLocation();
  }

  bool isLocationLoading = false;
  String locationError = "";

  Future<bool> handleLocationPermission() async {
    // 1. Check if location service is enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationError = 'Location services are disabled. Please enable GPS.';
      update();
      Get.snackbar(
        'Location Disabled',
        'Please enable location services in your device settings.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      return false;
    }

    // 2. Check permission status
    LocationPermission permission = await Geolocator.checkPermission();

    // 3. Request if denied
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationError = 'Location permission denied.';
        update();
        Get.snackbar(
          'Permission Denied',
          'Location permission is required to use this feature.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }
    }

    // 4. Permanently denied → open app settings
    if (permission == LocationPermission.deniedForever) {
      locationError = 'Location permission permanently denied.';
      update();
      Get.dialog(
        AlertDialog(
          title: const Text('Location Permission Required'),
          content: const Text(
            'Location permission is permanently denied. '
            'Please enable it from app settings.',
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Get.back();
                await Geolocator.openAppSettings(); // Opens iOS/Android settings
              },
              child: const Text('Open Settings'),
            ),
          ],
        ),
      );
      return false;
    }

    return true; // whileInUse or always — both are fine
  }

  Future<void> getCurrentLocation() async {
    try {
      isLocationLoading = true;
      locationError = '';
      update();

      // ✅ Permission check before fetching location
      final hasPermission = await handleLocationPermission();
      if (!hasPermission) return;

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );

      LatLng currentLatLng = LatLng(position.latitude, position.longitude);

      selectedLocation = currentLatLng;
      update();

      mapSelectController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentLatLng.latitude, currentLatLng.longitude),
            zoom: 11,
          ),
        ),
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLatLng.latitude,
        currentLatLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        addressController.text =
            "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";

        locationAddress =
            "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
        stateController.text = place.administrativeArea ?? "";
        cityController.text = place.locality ?? "";
        areaController.text = place.subLocality ?? "";
        zipcodeController.text = place.postalCode ?? "";

        update();
      }
      update();
    } catch (e) {
      update();
    }
  }

  List<Map<String, dynamic>> predictions = [];
  Timer? debounce;

  /// 🔹 Google Autocomplete API
  Future<void> searchPlaces(String query) async {
    if (query.isEmpty) {
      predictions = [];
      update();
      return;
    }

    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json'
        '?input=$query'
        '&key=AIzaSyDLgr8YB5IK8dBIEWClexZGzXaB7UlVm7Q';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    predictions = List<Map<String, dynamic>>.from(data['predictions']);
    print(predictions);
    update();
  }

  Future<void> getPlaceDetails(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json'
        '?place_id=$placeId'
        '&key=AIzaSyDLgr8YB5IK8dBIEWClexZGzXaB7UlVm7Q';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (data['status'] != 'OK') {
      debugPrint("Place details error: ${data['status']}");
      return;
    }

    final result = data['result'];

    final lat = result['geometry']['location']['lat'];
    final lng = result['geometry']['location']['lng'];
    final address = result['formatted_address'];

    String? city;
    String? state;
    String? area;
    String? pincode;
    String? country;

    final List components = result['address_components'];

    for (var component in components) {
      final List types = component['types'];

      if (types.contains('locality')) {
        city = component['long_name'];
      }

      if (types.contains('administrative_area_level_1')) {
        state = component['long_name'];
      }

      if (types.contains('sublocality') ||
          types.contains('sublocality_level_1')) {
        area = component['long_name'];
      }

      if (types.contains('postal_code')) {
        pincode = component['long_name'];
      }

      if (types.contains('country')) {
        country = component['long_name'];
      }
    }

    stateController.text = state ?? "";
    cityController.text = city ?? "";
    areaController.text = area ?? "";
    zipcodeController.text = pincode ?? "";

    debugPrint("Address : $address");
    debugPrint("Lat     : $lat");
    debugPrint("Lng     : $lng");
    debugPrint("City    : $city");
    debugPrint("State   : $state");
    debugPrint("Area    : $area");
    debugPrint("Pincode : $pincode");
    debugPrint("Country : $country");
  }

  /// 🔹 Debounce to reduce API calls
  void onSearchChanged(String value) {
    debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 400), () {
      searchPlaces(value);
    });
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
