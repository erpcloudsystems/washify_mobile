class TerritoryModel {
  final String id;
  final String name;
  bool? isSelected;

  TerritoryModel({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  void toggleSelection() {
    isSelected = !isSelected!;
  }

  factory TerritoryModel.fromJson(Map<String, dynamic> json) => TerritoryModel(
        id: json['name'],
        name: json['name'],
      );
}
