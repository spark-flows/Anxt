// coverage:ignore-file
import 'dart:io';

import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/data/data.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../domain/domain.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }

  late Dio dio;

  /// Api wrapper initialization
  final apiWrapper = ApiWrapper();

  /// Device info plugin initialization
  final deviceinfo = DeviceInfoPlugin();

  /// To get android device info
  AndroidDeviceInfo? androidDeviceInfo;

  /// To get iOS device info
  IosDeviceInfo? iosDeviceInfo;

  // IosDeviceInfo? iosDeviceInfo;

  // coverage:ignore-start
  /// initialize the andorid device information
  void _init() async {
    if (GetPlatform.isAndroid) {
      androidDeviceInfo = await deviceinfo.androidInfo;
    } else {
      iosDeviceInfo = await deviceinfo.iosInfo;
    }
    dio = Dio();
  }

  // coverage:ignore-end

  /// Device id
  String? get deviceId =>
      GetPlatform.isAndroid
          ? androidDeviceInfo?.id
          : iosDeviceInfo?.identifierForVendor;

  /// Device make brand
  String? get deviceMake =>
      GetPlatform.isAndroid ? androidDeviceInfo?.brand : 'Apple';

  /// Device Model
  String? get deviceModel =>
      GetPlatform.isAndroid ? androidDeviceInfo?.model : iosDeviceInfo?.model;

  /// Device is a type of 1 for Android and 2 for iOS
  String get deviceTypeCode => GetPlatform.isAndroid ? '1' : '2';

  /// Device OS
  String get deviceOs => GetPlatform.isAndroid ? 'ANDROID' : 'IOS';

  /// API to get the IP of the user
  Future<String> getIp() async {
    var ip = '';
    if (await Utility.isNetworkAvailable()) {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          ip = addr.address;
        }
      }
      return ip.isNotEmpty ? ip : '0.0.0.0';
    }
    return '0.0.0.0';
  }

  Future<ResponseModel> postLoginApi({
    bool isLoading = false,
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    var data = {
      "username": username,
      "password": password,
      // "fcm_token": fcmToken,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postLoginApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  Future<ResponseModel> postForgotApi({
    bool isLoading = false,
    required String email,
  }) async {
    var data = {"email": email};
    var response = await apiWrapper.makeRequest(
      EndPoints.postForgotApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  Future<ResponseModel> postResetApi({
    bool isLoading = false,
    required String content,
    required String iv,
    required String password,
  }) async {
    var data = {"content": content, "iv": iv, "password": password};
    var response = await apiWrapper.makeRequest(
      EndPoints.postResetApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  Future<ResponseModel> postCustomerAsssign({
    bool isLoading = false,
    required List<String> categoryid,
    required String? salesperson,
  }) async {
    var data = {"customerid": categoryid, "salesperson": salesperson};
    var response = await apiWrapper.makeRequest(
      EndPoints.postCustomerAsssign,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postAllUserList({
    bool isLoading = false,
    required int page,
    required int limit,
    required SearchModel search,
    required String salesPersonId,
    required String fromDate,
    required String todate,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "fromDate": fromDate,
      "toDate": todate,
      "salespersonid": salesPersonId,
      "sortfield": "customer",
      "sortoption": 1,
    };

    var response = await apiWrapper.makeRequest(
      EndPoints.postAllUsers,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postSalesList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String fromDate,
    required String todate,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "fromDate": fromDate,
      "toDate": todate,
      "sortfield": "customer",
      "sortoption": 1,
    };

    var response = await apiWrapper.makeRequest(
      EndPoints.postSalesList,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postCustomerList({bool isLoading = false}) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.postCustomerList,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGetOneUser({
    bool isLoading = false,
    required String salesid,
  }) async {
    var data = {"customerid": salesid};

    var response = await apiWrapper.makeRequest(
      EndPoints.postGetOneUsers,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getExpenseCategory({bool isLoading = false}) async {
    var response = await apiWrapper.makeRequest(
      '${EndPoints.getExpenseCategory}?page=1&limit=10&search',
      Request.get,
      {},
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getOneExpense({
    bool isLoading = false,
    required String expenseCatid,
  }) async {
    var data = {"expense_catid": expenseCatid};
    var response = await apiWrapper.makeRequest(
      EndPoints.getGetOneExpense,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postPriceMasterList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    var data = {"page": page, 'limit': limit, "search": "", "status": ""};
    var response = await apiWrapper.makeRequest(
      EndPoints.getPriceMasterList,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postAllExpense({
    bool isLoading = false,
    required int page,
    required int limit,
    required String tripid,
  }) async {
    var data = {
      "page": page,
      'limit': limit,
      "tripid": tripid,
      "sortOption": 1,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postAllExpense,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postAddToCart({
    bool isLoading = false,
    required String cartId,
    required String jobNo,
    required String customerid,
    required String salesmanid,
    required String salesid,
    required String salesexecutiveid,
    required String pricemasternameid,
    required String diamondrates,
    required String makingrate,
    required String stonerate,
  }) async {
    var data = {
      "cartid": cartId,
      'jobno': jobNo,
      "customerid": customerid,
      "salesmanid": salesmanid,
      "salesid": salesid,
      "salesexecutiveid": salesexecutiveid,
      "pricemasternameid": pricemasternameid,
      "diamondrates": diamondrates,
      "makingrate": makingrate,
      "stonerate": stonerate,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postAddToCart,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGetOneCart({
    bool isLoading = false,
    required String orderId,
  }) async {
    var data = {"cartid": orderId};
    var response = await apiWrapper.makeRequest(
      EndPoints.postGetOneCart,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postCreateCustomer({
    bool isLoading = false,
    required String? customerid,
    required String? salesperson,
    required String? name,
    required String? countrycode,
    required String? mobile,
    required String? email,
    required String? address,
    required String? state,
    required String? city,
    required String? area,
    required String? zipcode,
    required String? ownername,
    required String? ownermobile,
    required String? managername,
    required String? managermobile,
    required String? custcategory,
  }) async {
    var data = {
      "customerid": customerid,
      "salesperson": salesperson,
      "name": name,
      "countrycode": countrycode,
      "mobile": mobile,
      "email": email,
      "address": address,
      "state": state,
      "city": city,
      "area": area,
      "zipcode": zipcode,
      "ownername": ownername,
      "ownermobile": ownermobile,
      "managername": managername,
      "managermobile": managermobile,
      "custcategory": custcategory,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postCreateCustomer,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postSalesCreate({
    bool isLoading = false,
    required String salesId,
    required String salesPersonId,
    required List<AddProductModel> product,
    required String nextDate,
    required String customerId,
    required String storeIn,
    required String storeOut,
    required String status,
    required String piliStatus,
    required String weight,
    required String duration,
    required String customerNeeds,
    required String nextPurchase,
    required String customerReason,
    required String customerFeedback,
    required String customerCategory,
    required String location,
  }) async {
    var data = {
      "salesid": salesId,
      "salespersonid": salesPersonId,
      "product": product,
      "nextdate": nextDate,
      "customerid": customerId,
      "storein": storeIn,
      "storeout": storeOut,
      "status": status,
      "attempt": [],
      "pilistatus": piliStatus,
      "weight": weight,
      "duration": duration,
      "customerneeds": customerNeeds,
      "nextpurchase": nextPurchase,
      "customerreason": customerReason,
      "customerfeedback": customerFeedback,
      "customercategory": customerCategory,
      "location": location,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postCreateSales,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getProfileApi({bool isLoading = false}) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getProfileApi,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postAllFolders({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String parentid,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "search": search,
      "parentid": parentid,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postAllFolders,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postStockCatalogue({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
  }) async {
    var data = {"page": page, "limit": limit, "search": search};
    var response = await apiWrapper.makeRequest(
      EndPoints.postStockCatalogue,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGetProductList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String min,
    required String max,
    required String category,
    String sortfield = "shortname",
    int sortoption = 1,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "search": search,
      "min": min,
      "max": max,
      "category": category,
      "sortfield": sortfield,
      "sortoption": sortoption,
    };

    var response = await apiWrapper.makeRequest(
      EndPoints.postGetProductList,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGetAllTripList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String location,
    required String search,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "location": location,
      "search": {"tripname": search},
      "sortfield": 'start',
      "sortoption": 1,
    };

    var response = await apiWrapper.makeRequest(
      EndPoints.postGetAllTrips,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGetOneTripDetail({
    bool isLoading = false,
    required String tripId,
  }) async {
    var data = {'tripid': tripId};

    var response = await apiWrapper.makeRequest(
      EndPoints.postGetOneTrips,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postOrderHistoryList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String fromDate,
    required String toDate,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "fromDate": fromDate,
      "toDate": toDate,
      "sortfield": "createdAt",
      "sortoption": -1,
    };

    var response = await apiWrapper.makeRequest(
      EndPoints.postOrderHistory,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getDownloadInvoice({
    bool isLoading = false,
    required String orderNo,
  }) async {
    var response = await apiWrapper.makeRequest(
      '${EndPoints.getInvoice}$orderNo',
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getScaneData({
    bool isLoading = false,
    required String jobNo,
    required String pricemasternameid,
  }) async {
    var response = await apiWrapper.makeRequest(
      '${EndPoints.getScaneData}$jobNo&pricemasternameid=$pricemasternameid&slectedKt&makingrate&stonerate&diamondrates',
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postRemoveCart({
    bool isLoading = false,
    required String jobNo,
  }) async {
    var data = {'jobno': jobNo};
    var response = await apiWrapper.makeRequest(
      EndPoints.postRemoveCart,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  // Future<ResponseModel> postRemoveCart({
  //   bool isLoading = false,
  //   required String jobNo,
  // }) async {
  //   var data = {'jobno': jobNo};
  //   var response = await apiWrapper.makeRequest(
  //     EndPoints.postRemoveCart,
  //     Request.post,
  //     data,
  //     isLoading,
  //     Utility.commonHeader(),
  //   );
  //   return response;
  // }ORD-2B71E9

  Future<ResponseModel> postOrderDetail({
    bool isLoading = false,
    required String orderid,
  }) async {
    var data = {'orderid': orderid};

    var response = await apiWrapper.makeRequest(
      EndPoints.postGetOneOrderHistory,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postTripDelete({
    bool isLoading = false,
    required String tripId,
  }) async {
    var data = {'tripid': tripId};

    var response = await apiWrapper.makeRequest(
      EndPoints.postTripDelete,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getAllUser({bool isLoading = false}) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getAllUser,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postRegisterApi({
    bool isLoading = false,
    required String candidateapplicationid,
    required String branchid,
    required String employeename,
    required String jobopeningid,
    required String email,
    required String mobileno,
    required String source,
    required String status,
    required String applieddate,
    required String notesbyrecruiter,
    required String password,
    required List<ImageFormData> mediaFileList,
  }) async {
    var data = {
      "candidateapplicationid": candidateapplicationid,
      "branchid": branchid,
      "employeename": employeename,
      "jobopeningid": jobopeningid,
      "email": email,
      "mobileno": mobileno,
      "source": source,
      "status": status,
      "applieddate": applieddate,
      "notesbyrecruiter": notesbyrecruiter,
      "password": password,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postRegisterApi,
      Request.postWithFormData,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
      mediaFileList: mediaFileList,
    );
    return response;
  }

  Future<ResponseModel> postCreateTrip({
    bool isLoading = false,
    required String tripid,
    required String tripname,
    required String purpose,
    required String status,
    required int budget,
    required String start,
    required String end,
    required String location,
    required String remark,
    required List<String> participants,
    required String currency,
    required String image,
  }) async {
    var data = {
      "tripid": tripid,
      "tripname": tripname,
      "purpose": purpose,
      "status": status,
      "budget": budget,
      "start": start,
      "end": end,
      "location": location,
      "remark": remark,
      "participants": participants,
      "currency": currency,
      "image": image,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postCreateTrip,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postExpenseCreate({
    bool isLoading = false,
    required String expenseid,
    required String tripid,
    required String title,
    required String date,
    required String expenseCatid,
    required String userid,
    required String amount,
    required String remark,
    required String receipt,
  }) async {
    var data = {
      "expenseid": expenseid,
      "tripid": tripid,
      "title": title,
      "date": date,
      "expense_catid": expenseCatid,
      "userid": userid,
      "amount": amount,
      "receipt": receipt,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postExpenseCreate,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> uploadImage({
    bool isLoading = false,
    required String image,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadImage,
      Request.awsUpload,
      image,
      isLoading,
      Utility.commonHeader(),
      filename: "image",
    );
    return response;
  }

  Future<ResponseModel> postExpenseDelete({
    bool isLoading = false,
    required String? expenseid,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.postExpenseDelete,
      Request.post,
      {"expenseid": expenseid},
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> uploadExpenseImage({
    bool isLoading = false,
    required String image,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadExpenseImage,
      Request.awsUpload,
      image,
      isLoading,
      Utility.commonHeader(),
      filename: "image",
    );
    return response;
  }
}

class SearchModel {
  final String? code;
  final String? name;
  final String? email;
  final String? mobile;
  final String? address;
  final String? state;
  final String? city;
  final String? area;
  final String? zipcode;
  final String? assignby;
  final String? salesperson;

  SearchModel({
    this.code,
    this.name,
    this.email,
    this.mobile,
    this.address,
    this.state,
    this.city,
    this.area,
    this.zipcode,
    this.assignby,
    this.salesperson,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      address: json['address'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      area: json['area'] ?? '',
      zipcode: json['zipcode'] ?? '',
      assignby: json['assignby'] ?? '',
      salesperson: json['salesperson'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "name": name,
      "email": email,
      "mobile": mobile,
      "address": address,
      "state": state,
      "city": city,
      "area": area,
      "zipcode": zipcode,
      "assignby": assignby,
      "salesperson": salesperson,
    };
  }
}

class AddProductModel {
  AddProductModel({required this.productID, required this.weight});

  String productID;
  num weight;

  Map<String, dynamic> toJson() {
    return {'productid': productID, 'weight': weight};
  }
}
