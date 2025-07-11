import 'package:get/get.dart';

import '../controller/sign_in_page_controller.dart';

class SignInPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(SignInPageController.new);
}
