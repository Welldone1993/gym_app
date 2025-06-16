import '../../../../shared/model/enum/gender_enum.dart';

class AddAthleteDto {
  AddAthleteDto({
    required this.phoneNumber,
    required this.password,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.nationalCode,
  });

  final String phoneNumber;
  final String password;
  final String? firstName;
  final String? lastName;
  final String? email;
  final GenderEnum? gender;
  final String? nationalCode;

  Map<String, dynamic> toJson() => {
    'phoneNumber': phoneNumber,
    'password': password,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'gender': gender?.id,
    'nationalCode': nationalCode,
  };
}
