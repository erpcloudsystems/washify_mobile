class TerritoryModel {
  final String id;
  final String name;
  final String imageUrl;
  bool? isSelected;

  TerritoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isSelected = false,
  });

  void toggleSelection() {
    isSelected = !isSelected!;
  }

  factory TerritoryModel.fromJson(Map<String, dynamic> json) => TerritoryModel(
        id: json['name'],
        name: json['name'],
        imageUrl: json['custom_image'] ?? '',
      );
}
