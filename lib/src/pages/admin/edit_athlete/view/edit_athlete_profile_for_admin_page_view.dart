import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
import '../controller/edit_athlete_profile_for_admin_controller.dart';

class EditAthleteProfileForAdminPageView
    extends GetView<EditAthleteProfileForAdminController> {
  const EditAthleteProfileForAdminPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    pageTitle: ' ویرایش پروفایل کاربر',
    body: Placeholder(),
    onBackTap: Get.back,
  );
}
