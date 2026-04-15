import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/get_all_expences_category.dart';
import 'package:a_nxt/domain/models/get_one_expences.dart';

class TripPresenter {
  TripPresenter(this.tripUsecases);

  final TripUsecases tripUsecases;

  Future<GetAllTripModel?> postGetAllTripList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String location,
    required String toYear,
    required String fromYear,
    required dynamic status,
  }) async => await tripUsecases.postGetAllTripList(
    isLoading: isLoading,
    limit: limit,
    page: page,
    location: location,
    search: search,
    toYear: toYear,
    fromYear: fromYear,
    status: status,
  );

  Future<GetOneTripModel?> postGetOneTripDetail({
    bool isLoading = false,
    required String tripId,
  }) async => await tripUsecases.postGetOneTripDetail(
    isLoading: isLoading,
    tripId: tripId,
  );

  Future<ResponseModel?> postTripDelete({
    bool isLoading = false,
    required String tripId,
  }) async =>
      await tripUsecases.postTripDelete(isLoading: isLoading, tripId: tripId);

  Future<GetAllProductTypeModel?> getExpenseCategory({
    bool isLoading = false,
  }) async => await tripUsecases.getExpenseCategory(isLoading: isLoading);

  Future<GetOneExpenseCategory?> getOneExpense({
    bool isLoading = false,
    required String expenseCatid,
  }) async => await tripUsecases.getOneExpense(
    isLoading: isLoading,
    expenseCatid: expenseCatid,
  );

  Future<ResponseModel?> postCreateTrip({
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
  }) async => await tripUsecases.postCreateTrip(
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
    image: image,
    isLoading: isLoading,
  );

  Future<ResponseModel?> postExpenseDelete({
    bool isLoading = false,
    required String? expenseid,
  }) async => await tripUsecases.postExpenseDelete(
    expenseid: expenseid,
    isLoading: isLoading,
  );

  Future<ResponseModel?> postExpenseCreate({
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
  }) async => await tripUsecases.postExpenseCreate(
    expenseid: expenseid,
    tripid: tripid,
    title: title,
    date: date,
    expenseCatid: expenseCatid,
    userid: userid,
    amount: amount,
    remark: remark,
    receipt: receipt,
    isLoading: isLoading,
  );

  Future<ExpenseModel?> postAllExpense({
    bool isLoading = false,
    required int page,
    required int limit,
    required String tripid,
  }) async => await tripUsecases.postAllExpense(
    isLoading: isLoading,
    page: page,
    limit: limit,
    tripid: tripid,
  );

  Future<UserModel?> getAllUser({bool isLoading = false}) async =>
      await tripUsecases.getAllUser(isLoading: isLoading);

  Future<String?> uploadImage({
    bool isLoading = false,
    required String image,
  }) async =>
      await tripUsecases.uploadImage(image: image, isLoading: isLoading);
  Future<String?> uploadExpenseImage({
    bool isLoading = false,
    required String image,
  }) async =>
      await tripUsecases.uploadExpenseImage(image: image, isLoading: isLoading);
}
