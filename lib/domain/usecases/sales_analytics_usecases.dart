import 'package:a_nxt/data/helpers/connect_helper.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/add_to_cart_model.dart';
import 'package:a_nxt/domain/models/create_sales_model.dart';
import 'package:a_nxt/domain/models/getAll_product_model.dart';
import 'package:a_nxt/domain/models/get_all_expences_category.dart';
import 'package:a_nxt/domain/models/get_one_cart_model.dart';
import 'package:a_nxt/domain/models/priceMaster_model.dart';
import 'package:a_nxt/domain/models/product_detail_model.dart';
import 'package:a_nxt/domain/models/reqmove_from_cart_model.dart';

class SalesAnalyticsUsecases {
  SalesAnalyticsUsecases(this.repository);

  final Repository repository;

  Future<GetAllUsesList?> postAllUserList({
    bool isLoading = false,
    required int page,
    required int limit,
    required SearchModel search,
    required String salesPersonId,

    required String fromDate,
    required String toDate,
  }) async => await repository.postAllUserList(
    isLoading: isLoading,
    page: page,
    limit: limit,
    salesPersonId: salesPersonId,
    search: search,
    fromDate: fromDate,
    toDate: toDate,
  );

  Future<GetOneUser?> postGetOneUser({
    bool isLoading = false,
    required String salesid,
  }) async =>
      await repository.postGetOneUser(isLoading: isLoading, salesid: salesid);

  Future<GetAllProductTypeModel?> getExpenseCategory({
    bool isLoading = false,
  }) async => await repository.getExpenseCategory(isLoading: isLoading);

  Future<ResponseModel?> postCreateCustomer({
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
  }) async => await repository.postCreateCustomer(
    customerid: customerid,
    salesperson: salesperson,
    name: name,
    countrycode: countrycode,
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
    custcategory: custcategory,
    isLoading: isLoading,
  );

  Future<CustomerListModel?> postCustomerList({bool isLoading = false}) async =>
      await repository.postCustomerList(isLoading: isLoading);

  Future<ResponseModel?> postCustomerAsssign({
    bool isLoading = false,
    required List<String> categoryid,
    required String? salesperson,
  }) async => await repository.postCustomerAsssign(
    isLoading: isLoading,
    categoryid: categoryid,
    salesperson: salesperson,
  );

  Future<SalesListModel?> postSalesList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String fromDate,
    required String todate,
  }) async => await repository.postSalesList(
    isLoading: isLoading,
    limit: limit,
    page: page,
    fromDate: fromDate,
    todate: todate,
  );

  Future<CreateSalesModel?> postSalesCreate({
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
    required String salesId,
    required String customerCategory,
    required String location,
  }) async => await repository.postSalesCreate(
    isLoading: isLoading,
    salesId: salesId,
    salesPersonId: salesPersonId,
    product: product,
    nextDate: nextDate,
    customerId: customerId,
    storeIn: storeIn,
    storeOut: storeOut,
    status: status,
    piliStatus: piliStatus,
    weight: weight,
    duration: duration,
    customerNeeds: customerNeeds,
    nextPurchase: nextPurchase,
    customerReason: customerReason,
    customerFeedback: customerFeedback,
    customerCategory: customerCategory,
    location: location,
  );

  Future<ProductListModel?> postGetProductList({
    bool isLoading = false,
    required String category,
    required int page,
    required int limit,
    required String max,
    required String min,
    required String search,
  }) async => await repository.postGetProductList(
    isLoading: isLoading,
    category: category,
    page: page,
    limit: limit,
    max: max,
    min: min,
    search: search,
  );

  Future<ProductDetailModel?> getScaneData({
    bool isLoading = false,
    required String jobNo,
    required String pricemasternameId,
  }) async => await repository.getScaneData(
    isLoading: isLoading,
    jobNo: jobNo,
    pricemasternameId: pricemasternameId,
  );

  Future<RemoveFromCartModel?> postRemoveCart({
    bool isLoading = false,
    required String jobNo,
  }) async =>
      await repository.postRemoveCart(isLoading: isLoading, jobNo: jobNo);

  Future<PriceMasterListModel?> postPriceMasterList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async => await repository.postPriceMasterList(
    isLoading: isLoading,
    page: page,
    limit: limit,
  );

  Future<AddToCartModel?> postAddToCart({
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
  }) async => await repository.postAddToCart(
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

  Future<GetOneCartModel?> postGetOneCart({
    bool isLoading = false,
    required String orderId,
  }) async =>
      await repository.postGetOneCart(isLoading: isLoading, orderId: orderId);
}
