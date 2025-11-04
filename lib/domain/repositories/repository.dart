import 'dart:async';

import 'package:a_nxt/data/data.dart';
import 'package:a_nxt/device/device.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:a_nxt/domain/models/getAll_product_model.dart';

import '../../app/app.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  /// Clear data from local storage for [key].
  void clearData(dynamic key) {
    try {
      _deviceRepository.clearData(key);
    } catch (_) {
      _dataRepository.clearData(key);
    }
  }

  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key) {
    try {
      return _deviceRepository.getStringValue(key);
    } catch (_) {
      return _dataRepository.getStringValue(key);
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value) {
    try {
      _deviceRepository.saveValue(key, value);
    } catch (_) {
      _dataRepository.saveValue(key, value);
    }
  }

  /// Get the bool value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key) {
    try {
      return _deviceRepository.getBoolValue(key);
    } catch (_) {
      return _dataRepository.getBoolValue(key);
    }
  }

  /// Get the stored value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getStoredValue(String key) {
    try {
      return _deviceRepository.getBoolValue(key);
    } catch (_) {
      return _dataRepository.getBoolValue(key);
    }
  }

  /// Get the secure value for the [key].
  /// [key] : The key whose value is needed.
  Future<String> getSecureValue(String key) async {
    try {
      return await _deviceRepository.getSecuredValue(key);
    } catch (_) {
      return await _dataRepository.getSecuredValue(key);
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveSecureValue(String key, String value) {
    try {
      _deviceRepository.saveValueSecurely(key, value);
    } catch (_) {
      _dataRepository.saveValueSecurely(key, value);
    }
  }

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key) {
    try {
      _deviceRepository.deleteSecuredValue(key);
    } catch (_) {
      _dataRepository.deleteSecuredValue(key);
    }
  }

  /// Clear all data from secure storage .
  void deleteAllSecuredValues() {
    try {
      _deviceRepository.deleteAllSecuredValues();
    } catch (_) {
      _dataRepository.deleteAllSecuredValues();
    }
  }

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
  }) async {
    try {
      var response = await _dataRepository.postRegisterApi(
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

      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ForgotModel?> postForgotApi({
    bool isLoading = false,
    required String email,
  }) async {
    try {
      var response = await _dataRepository.postForgotApi(
        email: email,
        isLoading: isLoading,
      );
      var productListModel = forgotModelFromJson(response.data);
      if (productListModel.data != null) {
        return productListModel;
      } else {
        return productListModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetAllUsesList?> postAllUserList({
    bool isLoading = false,
    required int page,
    required int limit,
    required SearchModel search,
    required String fromDate,
    required String toDate,
  }) async {
    try {
      var response = await _dataRepository.postAllUserList(
        page: page,
        limit: limit,
        search: search,
        isLoading: isLoading,
        fromDate: fromDate,
        todate: toDate,
      );
      var getAllUserModel = getAllUsesListFromJson(response.data);
      if (getAllUserModel.data != null) {
        return getAllUserModel;
      } else {
        return getAllUserModel;
      }
    } catch (e) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneUser?> postGetOneUser({
    bool isLoading = false,
    required String salesid,
  }) async {
    try {
      var response = await _dataRepository.postGetOneUser(
        salesid: salesid,
        isLoading: isLoading,
      );
      var getOneUserModel = getOneUserFromJson(response.data);
      if (getOneUserModel.data != null) {
        return getOneUserModel;
      } else {
        return getOneUserModel;
      }
    } catch (e) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ProductListModel?> postGetProductList({
    bool isLoading = false,
    required String category,
    required int page,
    required int limit,
    required String max,
    required String min,
    required String search,
  }) async {
    try {
      var response = await _dataRepository.postGetProductList(
        category: category,
        page: page,
        limit: limit,
        max: max,
        min: min,
        search: search,
        isLoading: isLoading,
      );
      var productListModel = productListModelFromJson(response.data);
      if (productListModel.data != null) {
        return productListModel;
      } else {
        return productListModel;
      }
    } catch (e) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postResetApi({
    bool isLoading = false,
    required String content,
    required String iv,
    required String password,
  }) async {
    try {
      var response = await _dataRepository.postResetApi(
        content: content,
        iv: iv,
        password: password,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<AuthModel?> postLoginApi({
    bool isLoading = false,
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    try {
      var response = await _dataRepository.postLoginApi(
        username: username,
        password: password,
        fcmToken: fcmToken,
        isLoading: isLoading,
      );
      var productListModel = authModelFromJson(response.data);
      if (productListModel.data != null) {
        saveValue(
          LocalKeys.authToken,
          productListModel.data?.accessToken ?? "",
        );
        return productListModel;
      } else {
        return productListModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }
}
