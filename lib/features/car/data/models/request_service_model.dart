import 'dart:convert';

class RequestServiceModel {
  final String? id;
  final String subscriptionPlan;
  final String itemCode;
  final double price;
  final String territory;
  final String plateCode;
  final String model;
  final String brand;
  final int timesPerWeek;
  final String? startDate;
  final String? endDate;
  //final List<DaysWeekModel> weekDays;
  RequestServiceModel({
    this.id,
    required this.subscriptionPlan,
    required this.itemCode,
    required this.territory,
    required this.plateCode,
    required this.model,
    required this.brand,
    required this.price,
    required this.timesPerWeek,
    this.startDate,
    this.endDate,
    //this.weekDays = const [],
  });

  RequestServiceModel copyWith({
    String? id,
    String? subscriptionPlan,
    String? itemCode,
    String? territory,
    String? plateCode,
    String? model,
    String? brand,
    double? price,
    int? timesPerWeek,
    String? startDate,
    String? endDate,
  }) {
    return RequestServiceModel(
        id: id ?? this.id,
        subscriptionPlan: subscriptionPlan ?? this.subscriptionPlan,
        itemCode: itemCode ?? this.itemCode,
        territory: territory ?? this.territory,
        plateCode: plateCode ?? this.plateCode,
        model: model ?? this.model,
        brand: brand ?? this.brand,
        price: price ?? this.price,
        timesPerWeek: timesPerWeek ?? this.timesPerWeek,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }

  Map<String, dynamic> toMap() {
    // var selectedDays = [];
    /* for (var index in weekDays) {
      if (index.isSelected) {
        selectedDays.add(index.toMap());
      }
    }*/
    return <String, dynamic>{
      'subscription_plan': subscriptionPlan,
      'item_code': itemCode,
      'territory': territory,
      'plate_code': plateCode,
      'model': model,
      'brand': brand,
      //'blocked_days': selectedDays.toList(),
    };
  }

  factory RequestServiceModel.fromMap(Map<String, dynamic> map) {
    return RequestServiceModel(
      id: map['name'] ?? '',
      subscriptionPlan: map['subscription_plan'] ?? '',
      itemCode: map['item'] ?? '',
      territory: map['territory'] ?? '',
      plateCode: map['plate_code'] ?? '',
      model: map['model'] ?? '',
      brand: map['brand'] ?? '',
      price: map['cost'] ?? 0.0,
      timesPerWeek: map['times_per_week'] ?? 0,
      startDate: map['custom_start_date'] ?? '',
      endDate: map['custom_end_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestServiceModel.fromJson(String source) =>
      RequestServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestServiceModel(id: $id, subscriptionPlan: $subscriptionPlan, itemCode: $itemCode, territory: $territory, plateCode: $plateCode, model: $model, brand: $brand)';
  }

  @override
  bool operator ==(covariant RequestServiceModel other) {
    if (identical(this, other)) return true;

    return other.id == other.id &&
        other.subscriptionPlan == subscriptionPlan &&
        other.itemCode == itemCode &&
        other.territory == territory &&
        other.plateCode == plateCode &&
        other.model == model &&
        other.brand == brand;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        subscriptionPlan.hashCode ^
        itemCode.hashCode ^
        territory.hashCode ^
        plateCode.hashCode ^
        model.hashCode ^
        brand.hashCode;
  }
}
