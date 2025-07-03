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
    return VxBuilder(
      mutations: {AddMutation, RemoveMutation},
      builder: (context, _, __) {
        final CartModel cart = (VxState.store as MyStore).cart;
        final bool isInCart = cart.items.any((item) => item.id == catalog.id);

        return ElevatedButton(
          onPressed: () {
            if (!isInCart) {
              AddMutation(catalog);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context)
                      .elevatedButtonTheme
                      .style
                      ?.backgroundColor
                      ?.resolve({}) ??
                  Theme.of(context).colorScheme.primary,
            ),
            shape: MaterialStateProperty.all(
              const StadiumBorder(),
            ),
          ),
          child: isInCart
              ? const Icon(Icons.done)
              : const Icon(CupertinoIcons.cart_badge_plus),
        );
      },
    );
  }
}
