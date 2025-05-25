import 'package:get/get.dart';

import '../controller/add_athlete_controller.dart';


class AddAthleteBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(AddAthleteController.new);
}
