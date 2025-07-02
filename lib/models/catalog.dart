import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

  // Updated: ID is String, so convert int to String if needed
  Item getById(int id) => items.firstWhere(
        (element) => element.id == id.toString(),
        orElse: () => throw Exception('Item not found'),
      );

  Item getByPosition(int position) => items[position];
}

class Item {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String color;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.imageUrl,
  });

  Item copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? color,
    String? imageUrl,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
      'imageUrl': imageUrl,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'].toString(), // force to String for consistency
      name: map['name'],
      description: map['description'],
      price: (map['price'] as num).toDouble(),
      color: map['color'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, description: $description, price: $price, color: $color, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.color == color &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        color.hashCode ^
        imageUrl.hashCode;
  }
}
