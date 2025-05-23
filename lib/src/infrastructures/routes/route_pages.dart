import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gym_app/src/infrastructures/routes/route_names.dart';

import '../../pages/auth/sign_in/commons/sign_in_page_binding.dart';
import '../../pages/auth/sign_in/view/sign_in_page_view.dart';

class GymModulePages {
  static final List<GetPage<dynamic>> routes = [_signIn()];

  static GetPage<dynamic> _signIn() => GetPage(
    name: GymRouteNames.signInPage.path,
    page: SignInPageView.new,
    binding: SignInPageBinding(),
  );
}
