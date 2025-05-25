import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/button.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../controller/admin_home_page_controller.dart';

class AdminHomePageView extends GetView<AdminHomePageController> {
  const AdminHomePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    pageTitle: 'صفحه خانه',
    body: Column(
      children: [
        CustomButton(
          label: "پنل",
          action: () => Get.toNamed(GymRouteNames.adminPanelPage.uri),
        ),
        CustomButton(
          label: "ثبت ورزشکار",
          action: () => Get.toNamed(GymRouteNames.addAthletePage.uri),
        ),
        CustomButton(
          label: "فهرست ورزشکاران",
          action: () => Get.toNamed(GymRouteNames.athleteListPage.uri),
        ),
      ],
    ),
  );
}
