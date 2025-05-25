import 'package:get/get.dart';

import '../controller/renewal_athlete_profile_for_admin_controller.dart';

class RenewalAthleteProfileForAdminBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut(RenewalAthleteProfileForAdminController.new);
}
