import 'dart:convert';

class AddressModel {
  final String? id;
  final String subscriptionPlan;
  final String city;
  final String plateCode;
  final String model;
  final String brand;
  final int timesPerWeek;
  final String? startDate;
  final String? endDate;
  final String? addressLine;
  final num price;
  final String? itemCode;
  //final List<DaysWeekModel> weekDays;
  AddressModel({
    this.id,
    this.price = 0,
    this.itemCode,
    required this.subscriptionPlan,
    required this.city,
    required this.plateCode,
    required this.model,
    required this.brand,
    required this.timesPerWeek,
    this.startDate,
    this.endDate,
    this.addressLine,
    //this.weekDays = const [],
  });

  AddressModel copyWith({
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
    String? addressLine,
  }) {
    return AddressModel(
      id: id ?? this.id,
      price: price ?? this.price,
      itemCode: itemCode ?? this.itemCode,
      subscriptionPlan: subscriptionPlan ?? this.subscriptionPlan,
      city: territory ?? city,
      plateCode: plateCode ?? this.plateCode,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      timesPerWeek: timesPerWeek ?? this.timesPerWeek,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      addressLine: addressLine ?? this.addressLine,
    );
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
      "address_type": "Billing",
      'city': city,
      "address_line1": addressLine,
      "country": "Egypt",
      "doctype": "Address",
      'plate_code': plateCode,
      'model': model,
      'brand': brand,
      //'blocked_days': selectedDays.toList(),
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['name'] ?? '',
      subscriptionPlan: map['subscription_plan'] ?? '',
      city: map['city'] ?? '',
      plateCode: map['plate_code'] ?? '',
      model: map['model'] ?? '',
      brand: map['brand'] ?? '',
      timesPerWeek: map['times_per_week'] ?? 0,
      startDate: map['custom_start_date'] ?? '',
      endDate: map['custom_end_date'] ?? '',
      addressLine: map['address_line1'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestServiceModel(id: $id, subscriptionPlan: $subscriptionPlan, territory: $city, plateCode: $plateCode, model: $model, brand: $brand)';
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.id == other.id &&
        other.subscriptionPlan == subscriptionPlan &&
        other.city == city &&
        other.plateCode == plateCode &&
        other.model == model &&
        other.brand == brand;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        subscriptionPlan.hashCode ^
        city.hashCode ^
        plateCode.hashCode ^
        model.hashCode ^
        brand.hashCode;
  }
}
