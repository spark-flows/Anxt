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
  }) async => await tripUsecases.postGetAllTripList(
    isLoading: isLoading,
    limit: limit,
    page: page,
    search: search,
    location: location,
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
    required String budget,
    required String start,
    required String end,
    required String location,
    required String remark,
    required List<String> participants,
    required String currency,
    required List<ImageFormData> mediaFileList,
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
    mediaFileList: mediaFileList,
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
    required List<ImageFormData> mediaFileList,
  }) async => await tripUsecases.postExpenseCreate(
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

  Future<UserModel?> getAllUser({bool isLoading = false}) async =>
      await tripUsecases.getAllUser(isLoading: isLoading);
}
