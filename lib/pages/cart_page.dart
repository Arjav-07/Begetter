import 'package:begetter/main.dart';
import 'package:begetter/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: {AddMutation, RemoveMutation},
      builder: (context, _, __) {
        final cart = (VxState.store as MyStore).cart;
        return SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              "\$${cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.colorScheme.secondary)
                  .make(),
              30.widthBox,
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: "Buying not supported yet.".text.make(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.backgroundColor
                            ?.resolve({}) ??
                        context.theme.colorScheme.secondary,
                  ),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: "Buy".text.white.make(),
              ).w32(context)
            ],
          ),
        );
      },
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList();

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;

    return VxBuilder(
      mutations: {RemoveMutation},
      builder: (context, _, __) {
        return cart.items.isEmpty
            ? "Nothing to show".text.xl3.makeCentered()
            : ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      RemoveMutation(cart.items[index]);
                    },
                  ),
                  title: cart.items[index].name.text.make(),
                ),
              );
      },
    );
  }
}
