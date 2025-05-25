import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
import '../controller/renewal_athlete_profile_for_admin_controller.dart';

class RenewalAthleteProfileForAdminPageView
    extends GetView<RenewalAthleteProfileForAdminController> {
  const RenewalAthleteProfileForAdminPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    pageTitle: ' تمدید کاربر',
    body: Placeholder(),
    onBackTap: Get.back,
  );
}
