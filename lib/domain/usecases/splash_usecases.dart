import 'package:a_nxt/domain/domain.dart';

import '../models/getProfile_model.dart';

class SplashUseCases {
  SplashUseCases(this.repository);

  final Repository repository;

  Future<GetProfileModel?> getProfileApi({bool isLoading = false}) async =>
      await repository.getProfileApi(isLoading: isLoading);
}
