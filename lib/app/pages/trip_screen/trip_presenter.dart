import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/create_trip_model.dart';
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

  Future<TripCreatedModel?> postCreateTrip({
    bool isLoading = false,
    required Map<String, dynamic> formData,
    required List<ImageFormData> mediaFiles,
  }) async => await tripUsecases.postCreateTrip(
    isLoading: isLoading,
    formData: formData,
    mediaFiles: mediaFiles,
  );
}
