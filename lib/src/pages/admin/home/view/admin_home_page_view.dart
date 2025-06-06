import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/button.dart';
import '../../../../components/rectangle_button.dart';
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
        RectangleButton(
          title: 'فهرست ورزشکاران',
          onTap: () => Get.toNamed(GymRouteNames.athleteListPage.uri),
        ),
        RectangleButton(
          title: 'ثبت ورزشکار',
          onTap: () => Get.toNamed(GymRouteNames.addAthletePage.uri),
        ),
        RectangleButton(
          title: 'پنل',
          onTap: () => Get.toNamed(GymRouteNames.adminPanelPage.uri),
        ),
      ],
    ),
  );
}
