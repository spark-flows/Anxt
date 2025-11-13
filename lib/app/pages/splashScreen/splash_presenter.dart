import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/getProfile_model.dart';

class SplashPresenter {
  SplashPresenter(this.splashUseCases);

  final SplashUseCases splashUseCases;

  Future<GetProfileModel?> getProfileApi({bool isLoading = false}) async =>
      await splashUseCases.getProfileApi(isLoading: isLoading);
}
