class UserViewModel {
  final String id;
  final String role;
  final String mobile;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? avatar;

  UserViewModel({
    required this.id,
    required this.role,
    required this.mobile,
    this.firstName,
    this.lastName,
    this.email,
    this.avatar,
  });

  factory UserViewModel.fromJson(Map<String, dynamic> json) => UserViewModel(
        id: json['_id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        avatar: json['avatar'],
        role: json['role'],
        mobile: json['mobile'],
      );
}
