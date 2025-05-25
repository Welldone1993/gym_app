import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
import '../controller/admin_panel_controller.dart';

class AdminPanelPageView extends GetView<AdminPanelController> {
  const AdminPanelPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    pageTitle: 'پنل ادمین',
    body: Placeholder(),
    onBackTap: Get.back,
  );
}
