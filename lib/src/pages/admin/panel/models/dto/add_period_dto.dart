class AddPeriodDto {
  final int dayCount;
  final int sessionCount;

  AddPeriodDto({required this.dayCount, required this.sessionCount});

  Map<String, dynamic> toJson() => {
    'dayCount': dayCount,
    'sessionCount': sessionCount,
  };
}
