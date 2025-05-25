import 'package:get/get.dart';

import '../controller/admin_panel_controller.dart';

class AdminPanelBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(AdminPanelController.new);
}
