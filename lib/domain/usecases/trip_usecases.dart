import 'package:a_nxt/domain/models/create_trip_model.dart';
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

  Future<TripCreatedModel?> postCreateTrip({
    bool isLoading = false,
    required Map<String, dynamic> formData,
    required List<ImageFormData> mediaFiles,
  }) async => await repository.postCreateTrip(
    isLoading: isLoading,
    formData: formData,
    mediaFiles: mediaFiles,
  );
}
