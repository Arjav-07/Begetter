import 'package:begetter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:begetter/main.dart';

class CartModel {
  // Reference to the catalog
  late CatalogModel _catalog;

  // Store list of item IDs (as Strings)
  final List<String> _itemIds = [];

  // Getter for catalog
  CatalogModel get catalog => _catalog;

  // Setter for catalog
  set catalog(CatalogModel newCatalog) => _catalog = newCatalog;

  // Return all items in the cart using IDs
  List<Item> get items => _itemIds
      .map((id) => _catalog.getById(int.parse(id)))
      .whereType<Item>() // Filters out any nulls
      .toList();

  // Total price of cart items
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item to cart
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove item from cart
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() => store?.cart.add(item);
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() => store?.cart.remove(item);
}
