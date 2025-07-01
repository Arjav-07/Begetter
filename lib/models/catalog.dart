import 'package:begetter/models/catalog.dart';

class CatalogModel {
  static List<Item> items = [];

  // Get the item by ID
  Item? getById(int id) {
    return items.firstWhere(
      (item) => item.id == id.toString(),
      orElse: null,
    );
  }

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
    required this.imageUrl,
    required this.price,
    required this.color,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'].toString(),
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      price: (map['price'] as num).toDouble(),
      color: map['color'],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "price": price,
        "color": color,
      };
}
