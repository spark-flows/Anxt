import 'package:a_nxt/domain/domain.dart';

class AuthUsecases {
  AuthUsecases(this.repository);

  final Repository repository;

  Future<AuthModel?> postLoginApi({
    bool isLoading = false,
    required String username,
    required String password,
    required String fcmToken,
  }) async => await repository.postLoginApi(
    username: username,
    password: password,
    fcmToken: fcmToken,
    isLoading: isLoading,
  );

  Future<ForgotModel?> postForgotApi({
    bool isLoading = false,
    required String email,
  }) async =>
      await repository.postForgotApi(email: email, isLoading: isLoading);

  Future<ResponseModel?> postResetApi({
    bool isLoading = false,
    required String content,
    required String iv,
    required String password,
  }) async => await repository.postResetApi(
    content: content,
    iv: iv,
    password: password,
    isLoading: isLoading,
  );

  Future<ResponseModel?> postRegisterApi({
    bool isLoading = false,
    required String candidateapplicationid,
    required String branchid,
    required String employeename,
    required String jobopeningid,
    required String email,
    required String mobileno,
    required String source,
    required String status,
    required String applieddate,
    required String notesbyrecruiter,
    required String password,
    required List<ImageFormData> mediaFileList,
  }) async => await repository.postRegisterApi(
    candidateapplicationid: candidateapplicationid,
    branchid: branchid,
    employeename: employeename,
    jobopeningid: jobopeningid,
    email: email,
    mobileno: mobileno,
    source: source,
    status: status,
    applieddate: applieddate,
    notesbyrecruiter: notesbyrecruiter,
    password: password,
    mediaFileList: mediaFileList,
    isLoading: isLoading,
  );
}
