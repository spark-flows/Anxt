import 'package:a_nxt/app/pages/sales_analytics/sales_analytics_controller.dart';
import 'package:a_nxt/data/helpers/connect_helper.dart';
import 'package:a_nxt/domain/models/create_customer_model.dart';
import 'package:a_nxt/domain/models/create_sales_model.dart';
import 'package:a_nxt/domain/models/getAllUsers_model.dart';
import 'package:a_nxt/domain/models/getAll_product_model.dart';
import 'package:a_nxt/domain/models/getoneUser_Model.dart';
import 'package:a_nxt/domain/repositories/repository.dart';

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

  Future<CreateCustomerModel?> postCreateCustomer({
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
  }) async =>
      await repository.postCreateCustomer(isLoading: isLoading,
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
  }) async =>
      await repository.postSalesCreate(
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
      );

  Future<ProductListModel?> postGetProductList({
    bool isLoading = false,
    required String category,
    required int page,
    required int limit,
    required String max,
    required String min,
    required String search,
  }) async =>
      await repository.postGetProductList(
        isLoading: isLoading,
        category: category,
        page: page,
        limit: limit,
        max: max,
        min: min,
        search: search,
        );
}
