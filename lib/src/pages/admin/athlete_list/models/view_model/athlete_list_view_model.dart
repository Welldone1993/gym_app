class AthleteListViewModel {
  AthleteListViewModel({
    required this.athleteId,
    required this.isActive,
    this.firstName,
    this.lastName,
  });

  final int athleteId;
  final String? firstName;
  final String? lastName;
  final bool isActive;

  factory AthleteListViewModel.fromJson(Map<String, dynamic> json) =>
      AthleteListViewModel(
        athleteId: json['athleteId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        isActive: json['isActive'],
      );
}
