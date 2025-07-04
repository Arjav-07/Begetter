import 'package:begetter/core/store.dart';
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
        elevation: 0,
        title: "My Cart"
            .text
            .xl2
            .bold
            .color(context.theme.colorScheme.primary)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            const _CartList().expand(),
            const Divider(),
            _CartTotal(),
          ],
        ),
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
          height: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              "\$${cart.totalPrice.toStringAsFixed(2)}"
                  .text
                  .xl4
                  .color(context.theme.colorScheme.primary)
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
                child: "Buy".text.size(18).make(),
              ).wh24(context).h(40)
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
      mutations: {AddMutation, RemoveMutation},
      builder: (context, _, __) {
        return cart.items.isEmpty
            ? "Nothing to show".text.xl3.makeCentered()
            : ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  final qty = cart.getQuantity(item);
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Theme.of(context).cardColor,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          16.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                item.name.text.lg
                                    .color(context.theme.colorScheme.onSurface)
                                    .bold
                                    .make(),
                                "Quantity: $qty"
                                    .text
                                    .size(14)
                                    .color(context
                                        .theme.colorScheme.onSurfaceVariant)
                                    .make(),
                                "\$${item.price}"
                                    .text
                                    .color(context.theme.colorScheme.primary)
                                    .make(),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              RemoveMutation(item);
                            },
                            color: context.theme.colorScheme.primary,
                          ),
                          Text('$qty')
                              .text
                              .color(context.theme.colorScheme.onSurface)
                              .make(),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              AddMutation(item);
                            },
                            color: context.theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
