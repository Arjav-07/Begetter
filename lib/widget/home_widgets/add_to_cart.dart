import 'package:begetter/models/cart.dart';
import 'package:begetter/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    final _catalog = CatalogModel();
    _cart.catalog = _catalog;

    bool isInCart = _cart.items.contains(widget.catalog);

    // ...existing code...
    return ElevatedButton(
      onPressed: isInCart || isAdded
          ? null
          : () {
              _cart.add(widget.catalog);
              setState(() {
                isAdded = true;
              });
            },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(context.theme.colorScheme.secondary),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
        foregroundColor: MaterialStateProperty.all(
            Colors.white), // Ensures icon/text is white
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
