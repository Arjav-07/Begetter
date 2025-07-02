import 'package:begetter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:begetter/main.dart';

class CartModel {
  // Reference to the catalog
  late CatalogModel _catalog;

  // Store item quantities: key = item id (String), value = quantity
  final Map<String, int> _itemQuantities = {};

  // Getter for catalog
  CatalogModel get catalog => _catalog;

  // Setter for catalog
  set catalog(CatalogModel newCatalog) => _catalog = newCatalog;

  // Return all items in the cart using IDs
  List<Item> get items => _itemQuantities.keys
      .map((id) => _catalog.getById(int.parse(id)))
      .whereType<Item>()
      .toList();

  // Get quantity for an item
  int getQuantity(Item item) => _itemQuantities[item.id] ?? 0;

  // Total price of cart items
  num get totalPrice => _itemQuantities.entries.fold(
      0,
      (total, entry) =>
          total + (_catalog.getById(int.parse(entry.key)).price) * entry.value);

  // Add item to cart (increase quantity)
  void add(Item item) {
    _itemQuantities[item.id] = getQuantity(item) + 1;
  }

  // Remove item from cart (decrease quantity or remove)
  void remove(Item item) {
    final qty = getQuantity(item);
    if (qty > 1) {
      _itemQuantities[item.id] = qty - 1;
    } else {
      _itemQuantities.remove(item.id);
    }
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() => store!.cart.add(item);
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() => store!.cart.remove(item);
}
