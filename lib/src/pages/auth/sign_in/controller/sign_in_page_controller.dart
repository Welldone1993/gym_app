import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/src/infrastructures/routes/route_names.dart';

import '../../../../infrastructures/app_controller/app_controller.dart';
import '../model/sign_in_dto.dart';
import '../repository/sign_in_page_repository.dart';

class SignInPageController extends GetxController {
  final SignInPageRepository _repository = SignInPageRepository();

  final TextEditingController emailTextEditingController =
          TextEditingController(),
      passwordTextEditingController = TextEditingController();
  final RxBool isCheckingAccount = false.obs;

  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();


  Future<void> signIn() async {
    Get.offAllNamed(GymRouteNames.adminHomePage.uri);

    if (!emailFormKey.currentState!.validate() ||
        !passwordFormKey.currentState!.validate()) {
      return;
    }
    isCheckingAccount(true);
    final result = await _repository.signIn(dto: _dto());

    result.fold(
      (left) {
        Get.snackbar('', 'Try Again');
        isCheckingAccount(false);
      },
      (right) async {
        AppController().userToken = result.right.first;
        // await AppController().getUserInfo();
        isCheckingAccount(false);
        // Get.offAndToNamed(GymRouteNames.appBase.path);
      },
    );
  }

  SingInDto _dto() => SingInDto(
    email: emailTextEditingController.text.trim(),
    password: passwordTextEditingController.text.trim(),
  );
}
