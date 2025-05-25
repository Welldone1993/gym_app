import 'package:get/get.dart';

import '../controller/athlete_profile_for_admin_controller.dart';


class AthleteProfileForAdminBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(AthleteProfileForAdminController.new);
}
