import 'dart:convert';

class RequestServiceModel {
  final String subscriptionPlan;
  final String itemCode;
  final double price;
  final String territory;
  final String plateCode;
  final String model;
  final String brand;
  RequestServiceModel({
    required this.subscriptionPlan,
    required this.itemCode,
    required this.territory,
    required this.plateCode,
    required this.model,
    required this.brand,
    required this.price,
  });

  RequestServiceModel copyWith({
    String? subscriptionPlan,
    String? itemCode,
    String? territory,
    String? plateCode,
    String? model,
    String? brand,
    double? price,
  }) {
    return RequestServiceModel(
      subscriptionPlan: subscriptionPlan ?? this.subscriptionPlan,
      itemCode: itemCode ?? this.itemCode,
      territory: territory ?? this.territory,
      plateCode: plateCode ?? this.plateCode,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subscription_plan': subscriptionPlan,
      'item_code': itemCode,
      'territory': territory,
      'plate_code': plateCode,
      'model': model,
      'brand': brand,
    };
  }

  factory RequestServiceModel.fromMap(Map<String, dynamic> map) {
    return RequestServiceModel(
      subscriptionPlan: map['subscription_plan'] as String,
      itemCode: map['item'] as String,
      territory: map['territory'] as String,
      plateCode: map['plate_code'] as String,
      model: map['model'] as String,
      brand: map['brand'] as String,
      price: map['cost'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestServiceModel.fromJson(String source) =>
      RequestServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestServiceModel(subscriptionPlan: $subscriptionPlan, itemCode: $itemCode, territory: $territory, plateCode: $plateCode, model: $model, brand: $brand)';
  }

  @override
  bool operator ==(covariant RequestServiceModel other) {
    if (identical(this, other)) return true;

    return other.subscriptionPlan == subscriptionPlan &&
        other.itemCode == itemCode &&
        other.territory == territory &&
        other.plateCode == plateCode &&
        other.model == model &&
        other.brand == brand;
  }

  @override
  int get hashCode {
    return subscriptionPlan.hashCode ^
        itemCode.hashCode ^
        territory.hashCode ^
        plateCode.hashCode ^
        model.hashCode ^
        brand.hashCode;
  }
}
