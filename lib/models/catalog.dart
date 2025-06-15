class CatalogModel {
  static final items = [
    Item(
      id: "Prdt001",
      name: "iPhone 14 Pro",
      description: "Apple iPhone 14 Pro (128GB) - Space Black",
      price: 1100.0,
      colour: "Space Black",
      imageUrl:
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1662702896/Croma%20Assets/Communication/Mobiles/Images/261960_hxm0e3.png?tr=w-600",
    ),
  ]; // <-- Added missing semicolon
}

class Item {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String colour;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price, // <-- Fixed this line
    required this.colour,
  });
}
