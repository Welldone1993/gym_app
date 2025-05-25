import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/button.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../controller/athlete_profile_for_admin_controller.dart';

class AthleteProfileForAdminPageView
    extends GetView<AthleteProfileForAdminController> {
  const AthleteProfileForAdminPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    pageTitle: 'پروفایل کاربر',
    body: Column(
      children: [
        CustomButton(
          label: "ویرایش",
          action: () => Get.toNamed(GymRouteNames.editAthleteForAdminPage.uri),
        ),
        CustomButton(
          label: "تمدید",
          action:
              () => Get.toNamed(GymRouteNames.renewalAthleteForAdminPage.uri),
        ),
      ],
    ),
    onBackTap: Get.back,
  );
}
