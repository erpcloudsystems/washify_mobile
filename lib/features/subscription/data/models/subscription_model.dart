import 'dart:convert';

import 'package:washify_mobile/features/subscription/data/models/days_week_model.dart';

class SubscriptionModel {
  final String id;
  final String name;
  final String currency;
  final double price;
  final String priceDetermination;
  final String itemCode;
  final int timesPerWeek;
  bool isSelected;
  List<DaysWeekModel> selectedDays;
  SubscriptionModel({
    required this.id,
    required this.itemCode,
    required this.name,
    required this.currency,
    required this.price,
    required this.priceDetermination,
    required this.timesPerWeek,
    this.isSelected = false,
    this.selectedDays = const [],
  });

  void toggleSelected() {
    isSelected = !isSelected;
  }

  SubscriptionModel copyWith({
    String? id,
    String? name,
    String? currency,
    double? price,
    String? priceDetermination,
    String? itemCode,
    int? timesPerWeek,
  }) {
    return SubscriptionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      itemCode: itemCode ?? this.itemCode,
      currency: currency ?? this.currency,
      price: price ?? this.price,
      priceDetermination: priceDetermination ?? this.priceDetermination,
      timesPerWeek: timesPerWeek ?? this.timesPerWeek,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'currency': currency,
      'price': price,
      'priceDetermination': priceDetermination,
    };
  }

  factory SubscriptionModel.fromMap(Map<String, dynamic> map) {
    return SubscriptionModel(
      id: map['name'] as String,
      name: map['plan_name'] as String,
      currency: map['currency'] as String,
      itemCode: map['item'] as String,
      price: map['cost'] as double,
      priceDetermination: map['price_determination'] as String,
      timesPerWeek: map['custom_how_many_times_per_week'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriptionModel.fromJson(String source) =>
      SubscriptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubscriptionModel(id: $id, name: $name, currency: $currency, price: $price, priceDetermination: $priceDetermination)';
  }

  @override
  bool operator ==(covariant SubscriptionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.currency == currency &&
        other.price == price &&
        other.priceDetermination == priceDetermination;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        currency.hashCode ^
        price.hashCode ^
        priceDetermination.hashCode;
  }
}
