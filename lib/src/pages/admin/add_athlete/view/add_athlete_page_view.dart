import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
import '../controller/add_athlete_controller.dart';


class AddAthletePageView extends GetView<AddAthleteController> {
  const AddAthletePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    pageTitle: 'ثبت ورزشکار',
    body: Placeholder(),
    onBackTap: Get.back,
  );
}
