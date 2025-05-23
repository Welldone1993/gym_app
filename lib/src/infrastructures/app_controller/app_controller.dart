import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/route_names.dart';
import 'app_repository.dart';
import 'user_view_model.dart';

class AppController {
  factory AppController() => _instance;

  AppController._();

  static final AppController _instance = AppController._();

  final storage = GetStorage();

  late final String fullBaseUrl;
  String? userToken;
  Rxn<UserViewModel> userModel = Rxn<UserViewModel>();

  Future<void> initializeApp(final String? initialRoute) async {
    //   TODO: Get user Access and handle for sign up or sign in
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
