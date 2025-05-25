import 'package:get/get.dart';

import '../controller/athlete_list_controller.dart';

class AthleteListBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(AthleteListController.new);
}
