import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../pages/admin/add_athlete/commons/add_athlete_binding.dart';
import '../../pages/admin/add_athlete/view/add_athlete_page_view.dart';
import '../../pages/admin/athlete_list/commons/athlete_list_binding.dart';
import '../../pages/admin/athlete_list/view/athlete_list_page_view.dart';
import '../../pages/admin/athlete_profile/commons/athlete_profile_for_admin_binding.dart';
import '../../pages/admin/athlete_profile/view/athlete_profile_for_admin_page_view.dart';
import '../../pages/admin/edit_athlete/commons/edit_athlete_profile_for_admin_binding.dart';
import '../../pages/admin/edit_athlete/view/edit_athlete_profile_for_admin_page_view.dart';
import '../../pages/admin/home/commons/admin_home_page_binding.dart';
import '../../pages/admin/home/view/admin_home_page_view.dart';
import '../../pages/admin/panel/commons/admin_panel_binding.dart';
import '../../pages/admin/panel/view/admin_panel_page_view.dart';
import '../../pages/admin/renewal_athlete/commons/renewal_athlete_profile_for_admin_binding.dart';
import '../../pages/admin/renewal_athlete/view/renewal_athlete_profile_for_admin_page_view.dart';
import '../../pages/auth/sign_in/commons/sign_in_page_binding.dart';
import '../../pages/auth/sign_in/view/sign_in_page_view.dart';
import 'route_names.dart';

class GymModulePages {
  static final List<GetPage<dynamic>> routes = [_signIn, _adminHomePage];

  static GetPage<dynamic> get _signIn => GetPage(
    name: GymRouteNames.signInPage.path,
    page: SignInPageView.new,
    binding: SignInPageBinding(),
  );

  static GetPage<dynamic> get _adminHomePage => GetPage(
    name: GymRouteNames.adminHomePage.path,
    page: AdminHomePageView.new,
    binding: AdminHomePageBinding(),
    children: [_adminPanelPage, _addAthletePage, _athleteListPage],
  );

  static GetPage<dynamic> get _adminPanelPage => GetPage(
    name: GymRouteNames.adminPanelPage.path,
    page: AdminPanelPageView.new,
    binding: AdminPanelBinding(),
  );

  static GetPage<dynamic> get _addAthletePage => GetPage(
    name: GymRouteNames.addAthletePage.path,
    page: AddAthletePageView.new,
    binding: AddAthleteBinding(),
  );

  static GetPage<dynamic> get _athleteListPage => GetPage(
    name: GymRouteNames.athleteListPage.path,
    page: AthleteListPageView.new,
    binding: AthleteListBinding(),
    children: [_athleteProfileForAdminPage],
  );

  static GetPage<dynamic> get _athleteProfileForAdminPage => GetPage(
    name: GymRouteNames.athleteProfileForAdminPage.path,
    page: AthleteProfileForAdminPageView.new,
    binding: AthleteProfileForAdminBinding(),
    children: [_editAthleteForAdminPage, _renewalAthleteForAdminPage],
  );

  static GetPage<dynamic> get _editAthleteForAdminPage => GetPage(
    name: GymRouteNames.editAthleteForAdminPage.path,
    page: EditAthleteProfileForAdminPageView.new,
    binding: EditAthleteProfileForAdminBinding(),
  );

  static GetPage<dynamic> get _renewalAthleteForAdminPage => GetPage(
    name: GymRouteNames.renewalAthleteForAdminPage.path,
    page: RenewalAthleteProfileForAdminPageView.new,
    binding: RenewalAthleteProfileForAdminBinding(),
  );
}
