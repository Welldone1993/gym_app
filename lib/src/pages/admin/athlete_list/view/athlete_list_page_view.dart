import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/button.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../controller/athlete_list_controller.dart';

class AthleteListPageView extends GetView<AthleteListController> {
  const AthleteListPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    pageTitle: 'فهرست ورزشکاران',
    body: CustomActionButton(
      label: "پروفایل",
      action: () => Get.toNamed(GymRouteNames.athleteProfileForAdminPage.uri),
    ),
    onBackTap: Get.back,
  );
}
