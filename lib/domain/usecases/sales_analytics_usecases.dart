import 'package:a_nxt/data/helpers/connect_helper.dart';
import 'package:a_nxt/domain/models/getAllUsers_model.dart';
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
    required String fromDate,
    required String toDate,
  }) async => await repository.postAllUserList(
    isLoading: isLoading,
    page: page,
    limit: limit,
    search: search,
    fromDate: fromDate,
    toDate: toDate,
  );

  Future<GetOneUser?> postGetOneUser({
    bool isLoading = false,
    required String salesid,
  }) async =>
      await repository.postGetOneUser(isLoading: isLoading, salesid: salesid);
}
