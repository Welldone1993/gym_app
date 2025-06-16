class PeriodListViewModel {
  final int periodId;
  final int dayCount;
  final int sessionCount;

  PeriodListViewModel({
    required this.periodId,
    required this.dayCount,
    required this.sessionCount,
  });

  factory PeriodListViewModel.fromJson(Map<String, dynamic> json) =>
      PeriodListViewModel(
        periodId: json['periodId'],
        dayCount: json['dayCount'],
        sessionCount: json['sessionCount'],
      );
}
