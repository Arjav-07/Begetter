import 'package:begetter/core/store.dart';
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
    return VxBuilder<MyStore>(
      mutations: {AddMutation},
      builder: (context, _, store) {
        final CartModel _cart = (store as MyStore).cart;
        final bool isInCart = _cart.items.contains(catalog);

        return ElevatedButton(
          onPressed: isInCart
              ? null
              : () {
                  AddMutation(catalog);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: const StadiumBorder(),
          ),
          child: isInCart
              ? const Icon(Icons.done)
              : const Icon(CupertinoIcons.cart_badge_plus),
        );
      },
    );
  }
}
