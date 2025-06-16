class RepositoryUrls {
  /// Authentication
  static const String signIn = '/authentications/login';

  /// Period
  static const String addPeriod = '/period';
  static const String getAllPeriod = '/period/all';

  /// Athlete
  static const String addAthlete = '/athlete';

  /// Users
  static const String getAllUsers = '/users/all';


  static String getImage({
    required String folder,
    required String image,
  }) =>
      '/account/uploaded-image/$folder/$image';

}
