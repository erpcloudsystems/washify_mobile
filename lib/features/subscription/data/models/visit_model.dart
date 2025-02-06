class VisitModel {
  final String id;
  final String status;
  final String date;

  const VisitModel({
    required this.id,
    required this.status,
    required this.date,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) => VisitModel(
        id: json['name'] ?? '',
        status: json['status'] ?? '',
        date: json['date'] ?? '',
      );
}
