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
}
