import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/src/infrastructures/app_controller/user_view_model.dart';
import 'package:gym_app/src/infrastructures/routes/route_names.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../infrastructures/app_controller/app_controller.dart';
import '../model/sign_in_dto.dart';
import '../repository/sign_in_page_repository.dart';

class SignInPageController extends GetxController {
  final SignInPageRepository _repository = SignInPageRepository();

  final TextEditingController mobileTextEditingController =
          TextEditingController(),
      passwordTextEditingController = TextEditingController();
  final RxBool isCheckingAccount = false.obs;

  final GlobalKey<FormState> mobileFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    if (!mobileFormKey.currentState!.validate() ||
        !passwordFormKey.currentState!.validate()) {
      return;
    } else if (!mobileTextEditingController.text.startsWith('0') ||
        mobileTextEditingController.text.length > 11) {
      Get.snackbar('', 'شماره تماس را صحیح وارد کنید');
      return;
    }
    isCheckingAccount(true);
    final result = await _repository.signIn(dto: _dto());
    isCheckingAccount(false);
    result.fold((left) => Get.snackbar('', 'شماره تماس یا رمز ورود اشتباه است'), (
      right,
    ) async {
      AppController().userToken = result.right['token'];
      Map<String, dynamic> decodedToken = JwtDecoder.decode(
        AppController().userToken!,
      );
      AppController().userModel.value = UserViewModel(
        id:
            decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'],
        role:
            decodedToken['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'],
        mobile: mobileTextEditingController.text,
      );
      // await AppController().getUserInfo();
      Get.offAllNamed(GymRouteNames.adminHomePage.uri);
    });
  }

  SingInDto _dto() => SingInDto(
    userIdentifier: mobileTextEditingController.text.trim(),
    password: passwordTextEditingController.text.trim(),
  );
}
