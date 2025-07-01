import 'package:begetter/models/cart.dart';
import 'package:begetter/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    final _catalog = CatalogModel();
    _cart.catalog = _catalog;

    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
      onPressed: isInCart
          ? null
          : () {
              _cart.add(catalog);
              // No setState here, so UI will update only if parent rebuilds
            },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(context.theme.colorScheme.secondary),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: isInCart
          ? const Icon(Icons.done, color: Colors.white)
          : const Icon(CupertinoIcons.cart_badge_plus, color: Colors.white),
    );
  }
}
