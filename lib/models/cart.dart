import 'package:begetter/core/store.dart';
import 'package:begetter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // Catalog field
  late CatalogModel _catalog;

  // Store IDs of each item in the cart
  final List<int> _itemIds = [];

  // Getter for catalog
  CatalogModel get catalog => _catalog;

  // Setter for catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get list of items in the cart
  List<Item> get items =>
      _itemIds.map((id) => _catalog.getById(id)).whereType<Item>().toList();

  // Calculate total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item to cart
  void add(Item item) {
    if (!_itemIds.contains(item.id)) {
      _itemIds.add(item.id as int);
    }
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
  perform() {
    store!.cart.add(item);
  }
}
