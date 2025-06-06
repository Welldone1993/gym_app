import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/button.dart';
import '../../../../components/scaffold.dart';
import '../../../../components/text_field.dart';
import '../../../../infrastructures/utils/constants.dart';
import '../controller/sign_in_page_controller.dart';

class SignInPageView extends GetView<SignInPageController> {
  const SignInPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    pageTitle: "صفحه ورود",
    body: _body(),
    backgroundImage: Constants.logInGym,
    opacity: 0.3,
  );

  Widget _body() => Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _mobileTextField(),
          _passwordTextField(),
          Constants.largeVerticalSpacer,
          Obx(() => _signInButton()),
        ],
      ),
    ),
  );

  Widget _passwordTextField() => CustomTextField(
    title: "پسوورد",
    textController: controller.passwordTextEditingController,
    isPassword: true,
    formKey: controller.passwordFormKey,
    isRequired: true,
  );

  Widget _mobileTextField() => CustomTextField(
    title: "موبایل",
    textController: controller.mobileTextEditingController,
    isRequired: true,
    formKey: controller.mobileFormKey,
    isNumber: true,
  );

  Widget _signInButton() => CustomButton(
    isDisable: controller.isCheckingAccount.value,
    label: "ورود",
    action: controller.signIn,
  );
}
