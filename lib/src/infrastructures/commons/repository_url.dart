class RepositoryUrls {
  /// Authentication
  static const String signIn = '/auth/register-with-email';

  static String getImage({
    required String folder,
    required String image,
  }) =>
      '/account/uploaded-image/$folder/$image';

}
