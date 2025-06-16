enum GenderEnum {
  male(id: 1, title: 'مذکر'),
  female(id: 2, title: 'مونث');

  final int id;
  final String title;

  const GenderEnum({required this.id, required this.title});
}
