import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/getProfile_model.dart';

class ProfileUsecases {
  ProfileUsecases(this.repository);

  final Repository repository;

  Future<GetProfileModel?> getProfileApi({bool isLoading = false}) async =>
      await repository.getProfileApi(isLoading: isLoading);
}
