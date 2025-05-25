import 'route_paths.dart';

class Routes {
  final String uri;
  final String path;

  const Routes(this.uri, [final String? path]) : path = path ?? uri;
}

class GymRouteNames extends Routes {
  GymRouteNames(super.uri);

  /// Authentication

  static const Routes signInPage = Routes(
    RoutePaths.signInPage,
    RoutePaths.signInPage,
  );

  /// Admin

  static const Routes adminHomePage = Routes(
    RoutePaths.adminHomePage,
    RoutePaths.adminHomePage,
  );
  static const Routes adminPanelPage = Routes(
    RoutePaths.adminHomePage + RoutePaths.adminPanelPage,
    RoutePaths.adminPanelPage,
  );
  static const Routes addAthletePage = Routes(
    RoutePaths.adminHomePage + RoutePaths.addAthletePage,
    RoutePaths.addAthletePage,
  );
  static const Routes athleteListPage = Routes(
    RoutePaths.adminHomePage + RoutePaths.athleteListPage,
    RoutePaths.athleteListPage,
  );
  static const Routes athleteProfileForAdminPage = Routes(
    RoutePaths.adminHomePage +
        RoutePaths.athleteListPage +
        RoutePaths.athleteProfileForAdminPage,
    RoutePaths.athleteProfileForAdminPage,
  );

  static const Routes editAthleteForAdminPage = Routes(
    RoutePaths.adminHomePage +
        RoutePaths.athleteListPage +
        RoutePaths.athleteProfileForAdminPage +
        RoutePaths.editAthleteForAdminPage,
    RoutePaths.editAthleteForAdminPage,
  );

  static const Routes renewalAthleteForAdminPage = Routes(
    RoutePaths.adminHomePage +
        RoutePaths.athleteListPage +
        RoutePaths.athleteProfileForAdminPage +
        RoutePaths.renewalAthleteForAdminPage,
    RoutePaths.renewalAthleteForAdminPage,
  );
}
