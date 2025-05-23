class SingInDto {
  final String email;
  final String password;

  SingInDto({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
