import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/infrastructures/routes/route_names.dart';
import 'src/infrastructures/routes/route_pages.dart';

class GymApp extends StatelessWidget {
  const GymApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    getPages: [...GymModulePages.routes],
    initialRoute: GymRouteNames.signInPage.uri,
    debugShowCheckedModeBanner: true,
  );
}
