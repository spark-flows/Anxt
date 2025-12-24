import 'package:a_nxt/data/data.dart';
import 'package:a_nxt/domain/domain.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);

  final ConnectHelper connectHelper;

  @override
  void clearData(dynamic key) {
    throw UnimplementedError();
  }

  /// Delete the box
  @override
  void deleteBox() {
    throw UnimplementedError();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    throw UnimplementedError();
  }

  /// return bool value
  @override
  bool getBoolValue(String key) => throw UnimplementedError();

  /// Get data from secure storage
  @override
  Future<String> getSecuredValue(String key) async {
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    throw UnimplementedError();
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    throw UnimplementedError();
  }

  /// API to get the IP of the user
  @override
  Future<String> getIp() async => await connectHelper.getIp();

  Future<ResponseModel> postLoginApi({
    bool isLoading = false,
    required String username,
    required String password,
    required String fcmToken,
  }) async => await connectHelper.postLoginApi(
    username: username,
    password: password,
    fcmToken: fcmToken,
    isLoading: isLoading,
  );

  Future<ResponseModel> postForgotApi({
    bool isLoading = false,
    required String email,
  }) async =>
      await connectHelper.postForgotApi(email: email, isLoading: isLoading);

  Future<ResponseModel> postAllUserList({
    bool isLoading = false,
    required int page,
    required int limit,
    required SearchModel search,
    required String fromDate,
    required String todate,
    required String salesPersonId,
  }) async => await connectHelper.postAllUserList(
    isLoading: isLoading,
    limit: limit,
    page: page,
    search: search,
    salesPersonId: salesPersonId,
    fromDate: fromDate,
    todate: todate,
  );

  Future<ResponseModel> postGetOneUser({
    bool isLoading = false,
    required String salesid,
  }) async => await connectHelper.postGetOneUser(
    isLoading: isLoading,
    salesid: salesid,
  );

  Future<ResponseModel> getExpenseCategory({bool isLoading = false}) async =>
      await connectHelper.getExpenseCategory(isLoading: isLoading);

  Future<ResponseModel> getOneExpense({
    bool isLoading = false,
    required String expenseCatid,
  }) async => await connectHelper.getOneExpense(
    isLoading: isLoading,
    expenseCatid: expenseCatid,
  );

  Future<ResponseModel> postPriceMasterList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async => await connectHelper.postPriceMasterList(
    isLoading: isLoading,
    page: page,
    limit: limit,
  );

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
  }) async => await connectHelper.postAddToCart(
    isLoading: isLoading,
    cartId: cartId,
    jobNo: jobNo,
    customerid: customerid,
    salesmanid: salesmanid,
    salesid: salesid,
    salesexecutiveid: salesexecutiveid,
    pricemasternameid: pricemasternameid,
    diamondrates: diamondrates,
    makingrate: makingrate,
    stonerate: stonerate,
  );

  Future<ResponseModel> postGetOneCart({
    bool isLoading = false,
    required String orderId,
  }) async => await connectHelper.postGetOneCart(
    isLoading: isLoading,
    orderId: orderId,
  );

  Future<ResponseModel> postCreateCustomer({
    bool isLoading = false,
    required String customerId,
    required String salesperson,
    required String name,
    required String mobile,
    required String email,
    required String address,
    required String state,
    required String city,
    required String area,
    required String zipcode,
    required String ownername,
    required String ownermobile,
    required String managername,
    required String managermobile,
  }) async => await connectHelper.postCreateCustomer(
    isLoading: isLoading,
    salesperson: salesperson,
    customerId: customerId,
    name: name,
    mobile: mobile,
    email: email,
    address: address,
    state: state,
    city: city,
    area: area,
    zipcode: zipcode,
    ownername: ownername,
    ownermobile: ownermobile,
    managername: managername,
    managermobile: managermobile,
  );

  Future<ResponseModel> postSalesCreate({
    bool isLoading = false,
    required String salesPersonId,
    required List<AddProductModel> product,
    required String nextDate,
    required String salesId,
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
  }) async => await connectHelper.postSalesCreate(
    isLoading: isLoading,
    salesId: salesId,
    customerId: customerId,
    duration: duration,
    nextDate: nextDate,
    customerNeeds: customerNeeds,
    nextPurchase: nextPurchase,
    customerReason: customerReason,
    customerFeedback: customerFeedback,
    customerCategory: customerCategory,
    piliStatus: piliStatus,
    salesPersonId: salesPersonId,
    status: status,
    storeIn: storeIn,
    storeOut: storeOut,
    weight: weight,
    product: product,
  );

  Future<ResponseModel> postGetProductList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String category,
    required String search,
    required String max,
    required String min,
  }) async => await connectHelper.postGetProductList(
    isLoading: isLoading,
    category: category,
    limit: limit,
    page: page,
    search: search,
    max: max,
    min: min,
  );

  Future<ResponseModel> postGetAllTripList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String location,
    required String search,
  }) async => await connectHelper.postGetAllTripList(
    isLoading: isLoading,
    limit: limit,
    page: page,
    location: location,
    search: search,
  );

  Future<ResponseModel> postGetOneTripDetail({
    bool isLoading = false,
    required String tripId,
  }) async => await connectHelper.postGetOneTripDetail(
    isLoading: isLoading,
    tripId: tripId,
  );

  Future<ResponseModel> postOrderHistoryList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String fromDate,
    required String toDate,
  }) async => await connectHelper.postOrderHistoryList(
    page: page,
    limit: limit,
    toDate: toDate,
    fromDate: fromDate,
    isLoading: isLoading,
  );

  Future<ResponseModel> getInvoiceApi({
    bool isLoading = false,
    required String orderNo,
  }) async => await connectHelper.getDownloadInvoice(orderNo: orderNo);

  Future<ResponseModel> getScaneData({
    bool isLoading = false,
    required String jobNo,
    required String pricemasternameid,
  }) async => await connectHelper.getScaneData(
    jobNo: jobNo,
    pricemasternameid: pricemasternameid,
  );

  Future<ResponseModel> postRemoveCart({
    bool isLoading = false,
    required String jobNo,
  }) async => await connectHelper.postRemoveCart(jobNo: jobNo);

  Future<ResponseModel> postOrderDetail({
    bool isLoading = false,
    required String orderId,
  }) async => await connectHelper.postOrderDetail(
    isLoading: isLoading,
    orderid: orderId,
  );

  Future<ResponseModel> postTripDelete({
    bool isLoading = false,
    required String tripId,
  }) async =>
      await connectHelper.postTripDelete(isLoading: isLoading, tripId: tripId);

  Future<ResponseModel> getProfileApi({bool isLoading = false}) async =>
      await connectHelper.getProfileApi(isLoading: isLoading);

  Future<ResponseModel> getAllUser({bool isLoading = false}) async =>
      await connectHelper.getAllUser(isLoading: isLoading);

  Future<ResponseModel> postResetApi({
    bool isLoading = false,
    required String content,
    required String iv,
    required String password,
  }) async => await connectHelper.postResetApi(
    content: content,
    iv: iv,
    password: password,
    isLoading: true,
  );

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
  }) async => await connectHelper.postRegisterApi(
    candidateapplicationid: candidateapplicationid,
    branchid: branchid,
    employeename: employeename,
    jobopeningid: jobopeningid,
    email: email,
    mobileno: mobileno,
    source: source,
    status: status,
    applieddate: applieddate,
    notesbyrecruiter: notesbyrecruiter,
    password: password,
    isLoading: isLoading,
    mediaFileList: mediaFileList,
  );

  Future<ResponseModel> postAllFolders({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String parentid,
  }) async => await connectHelper.postAllFolders(
    page: page,
    limit: limit,
    search: search,
    parentid: parentid,
    isLoading: isLoading,
  );

  Future<ResponseModel> postStockCatalogue({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
  }) async => await connectHelper.postStockCatalogue(
    page: page,
    limit: limit,
    search: search,
    isLoading: isLoading,
  );

  Future<ResponseModel> postCreateTrip({
    bool isLoading = false,
    required String tripid,
    required String tripname,
    required String purpose,
    required String status,
    required String budget,
    required String start,
    required String end,
    required String location,
    required String remark,
    required List<String> participants,
    required String currency,
    required List<ImageFormData> mediaFileList,
  }) async => await connectHelper.postCreateTrip(
    tripid: tripid,
    tripname: tripname,
    purpose: purpose,
    status: status,
    budget: budget,
    start: start,
    end: end,
    location: location,
    remark: remark,
    participants: participants,
    currency: currency,
    mediaFileList: mediaFileList,
    isLoading: isLoading,
  );

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
    required List<ImageFormData> mediaFileList,
  }) async => await connectHelper.postExpenseCreate(
    expenseid: expenseid,
    tripid: tripid,
    title: title,
    date: date,
    expenseCatid: expenseCatid,
    userid: userid,
    amount: amount,
    remark: remark,
    mediaFileList: mediaFileList,
    isLoading: isLoading,
  );
}
