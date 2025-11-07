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
  }) async => await connectHelper.postAllUserList(
    isLoading: isLoading,
    limit: limit,
    page: page,
    search: search,
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

  Future<ResponseModel> postCreateCustomer({
    bool isLoading = false,
    required String customerId,
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

  Future<ResponseModel> getProfileApi({bool isLoading = false}) async =>
      await connectHelper.getProfileApi(isLoading: isLoading);

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
}
