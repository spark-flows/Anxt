import 'package:a_nxt/domain/models/getProfile_model.dart';
import 'package:a_nxt/domain/usecases/profile_usecases.dart';

class ProfilePreneter {
  ProfilePreneter(this.profileUsecases);

  final ProfileUsecases profileUsecases;

  Future<GetProfileModel?> getProfileApi({bool isLoading = false}) async =>
      await profileUsecases.getProfileApi(isLoading: isLoading);
}
