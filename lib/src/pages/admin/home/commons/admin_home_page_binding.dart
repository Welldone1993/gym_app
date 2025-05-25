import 'package:get/get.dart';

import '../controller/admin_home_page_controller.dart';

class AdminHomePageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(AdminHomePageController.new);
}
