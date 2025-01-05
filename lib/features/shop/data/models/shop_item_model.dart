
class ShopItemModel {
  ShopItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  final String id;
  final String name;
  final String description;
  final String image;
  final num price;

  factory ShopItemModel.fromMap(Map<String, dynamic> map) {
    return ShopItemModel(
      id: map['name'] ?? '',
      name: map['item_name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      price: map['standard_rate'] ?? 0.0,
    );
  }
}
