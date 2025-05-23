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
        pageTitle: controller.getPageTitle,
        body: _body(),
        onBackTap: Get.back,
      );

  Widget _body() => SingleChildScrollView(
        child: Column(
          children: [
            _emailTextField(),
            _passwordTextField(),
            Constants.largeVerticalSpacer,
            Obx(() => _signInButton()),
          ],
        ),
      );

  Widget _passwordTextField() => CustomTextField(
        title: "LocaleKeys.social_sport_app_auth_password.tr",
        textController: controller.passwordTextEditingController,
        isPassword: true,
        formKey: controller.passwordFormKey,
        isRequired: true,
      );

  Widget _emailTextField() => CustomTextField(
        title: "LocaleKeys.social_sport_app_shared_email.tr",
        textController: controller.emailTextEditingController,
        isRequired: true,
        formKey: controller.emailFormKey,
      );

  Widget _signInButton() => CustomButton(
        isDisable: controller.isCheckingAccount.value,
        label: "LocaleKeys.social_sport_app_auth_sign_in.tr",
        action: controller.signIn,
      );
}
