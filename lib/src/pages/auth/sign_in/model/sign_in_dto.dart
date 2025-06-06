class SingInDto {
  final String userIdentifier;
  final String password;

  SingInDto({
    required this.userIdentifier,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "userIdentifier": userIdentifier,
        "password": password,
      };
}
