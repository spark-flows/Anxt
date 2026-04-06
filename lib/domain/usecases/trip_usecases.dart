import 'package:a_nxt/domain/models/get_all_expences_category.dart';
import 'package:a_nxt/domain/models/get_one_expences.dart';
import 'package:a_nxt/domain/models/models.dart';
import 'package:a_nxt/domain/repositories/repository.dart';

class TripUsecases {
  TripUsecases(this.repository);

  final Repository repository;

  Future<GetAllTripModel?> postGetAllTripList({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String location,
  }) async => await repository.postGetAllTripList(
    isLoading: isLoading,
    page: page,
    limit: limit,
    search: search,
    location: location,
  );

  Future<GetOneTripModel?> postGetOneTripDetail({
    bool isLoading = false,
    required String tripId,
  }) async => await repository.postGetOneTripDetail(
    isLoading: isLoading,
    tripId: tripId,
  );

  Future<ResponseModel?> postTripDelete({
    bool isLoading = false,
    required String tripId,
  }) async =>
      await repository.postTripDelete(isLoading: isLoading, tripId: tripId);

  Future<GetAllProductTypeModel?> getExpenseCategory({
    bool isLoading = false,
  }) async => await repository.getExpenseCategory(isLoading: isLoading);

  Future<GetOneExpenseCategory?> getOneExpense({
    bool isLoading = false,
    required String expenseCatid,
  }) async => await repository.getOneExpense(
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
  }) async => await repository.postCreateTrip(
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
  }) async => await repository.postExpenseDelete(
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
  }) async => await repository.postExpenseCreate(
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
  }) async => await repository.postAllExpense(
    isLoading: isLoading,
    page: page,
    limit: limit,
    tripid: tripid,
  );

  Future<UserModel?> getAllUser({bool isLoading = false}) async =>
      await repository.getAllUser(isLoading: isLoading);

  Future<String?> uploadImage({
    bool isLoading = false,
    required String image,
  }) async => await repository.uploadImage(image: image, isLoading: isLoading);

  Future<String?> uploadExpenseImage({
    bool isLoading = false,
    required String image,
  }) async =>
      await repository.uploadExpenseImage(image: image, isLoading: isLoading);
}
