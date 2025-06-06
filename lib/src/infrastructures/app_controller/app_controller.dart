import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'user_view_model.dart';

class AppController {
  factory AppController() => _instance;

  AppController._();

  static final AppController _instance = AppController._();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  late final String fullBaseUrl;
  String? userToken;
  String? refreshToken;
  Rxn<UserViewModel> userModel = Rxn<UserViewModel>();

  Future<void> initializeApp(final String? initialRoute) async {
    //   TODO: Get user Access and handle for sign up or sign in
  }

  Future<void> loadTokens() async {
    userToken = await _secureStorage.read(key: 'access_token') ?? '';
    refreshToken = await _secureStorage.read(key: 'refresh_token') ?? '';
  }

  // Call this after login or token refresh
  Future<void> setTokens(String access, String refresh) async {
    userToken = access;
    refreshToken = refresh;

    await _secureStorage.write(key: 'access_token', value: access);
    await _secureStorage.write(key: 'refresh_token', value: refresh);
  }

  Future<void> clearTokens() async {
    userToken = '';
    refreshToken = '';
    await _secureStorage.deleteAll();
  }

  // Future<void> getUserInfo() async {
  //   final result = await AppRepository().getProfileInfo();
  //   result.fold((left) => null, (right) => userModel.value = right);
  // }
  //
  // void deleteAllDataWhenLogOut() {
  //   //   TODO: Delete all data when log out
  // }

  // Future<void> logout() async {
  //   final result = await AppRepository().logout();
  //
  //   if (result.isRight) {
  //     userToken = null;
  //     userModel.value = null;
  //     Get.offAllNamed(GymRouteNames.signInPage.path);
  //   }
  // }

  String getUserFullName() =>
      '${userModel.value?.firstName ?? '-'} ${userModel.value?.lastName ?? ''} ';
}
