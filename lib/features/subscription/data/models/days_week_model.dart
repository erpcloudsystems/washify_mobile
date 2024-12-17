class DaysWeekModel {
  final String name;
  final String shortCut;
  bool isSelected;

  DaysWeekModel({
    required this.name,
    required this.shortCut,
    this.isSelected = false,
  });

  void toggleSelected() {
    isSelected = !isSelected;
  }

  Map<String, dynamic> toMap() => {'day': shortCut};
}

final listOfWeekDays = [
  DaysWeekModel(name: 'Saturday', shortCut: 'Sat'),
  DaysWeekModel(name: 'Sunday', shortCut: 'Sun'),
  DaysWeekModel(name: 'Monday', shortCut: 'Mon'),
  DaysWeekModel(name: 'Tuesday', shortCut: 'Tus'),
  DaysWeekModel(name: 'Wednesday', shortCut: 'Wen'),
  DaysWeekModel(name: 'Thursday', shortCut: 'Thu'),
  DaysWeekModel(name: 'Friday', shortCut: 'Fri'),
];
