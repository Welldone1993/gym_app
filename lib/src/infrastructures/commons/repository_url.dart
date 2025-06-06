class RepositoryUrls {
  /// Authentication
  static const String signIn = '/authentications/login';

  static String getImage({
    required String folder,
    required String image,
  }) =>
      '/account/uploaded-image/$folder/$image';

}
