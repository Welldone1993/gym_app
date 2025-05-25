import 'package:get/get.dart';

import '../controller/edit_athlete_profile_for_admin_controller.dart';

class EditAthleteProfileForAdminBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(EditAthleteProfileForAdminController.new);
}
