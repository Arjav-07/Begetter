import 'package:begetter/models/catalog.dart';
import 'package:begetter/widget/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatefulWidget {
  final Item catalog;
  HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
    final catalog = widget.catalog;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl2.red800.make(),
            AddToCart(
              catalog: catalog,
            ).wh(130, 40), // Use the same button as in catalog list
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.imageUrl),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(Theme.of(context).colorScheme.primary)
                        .bold
                        .make(),
                    catalog.description.text
                        .color(Theme.of(context).colorScheme.tertiary)
                        .textStyle(context.captionStyle)
                        .xl
                        .make(),
                    10.heightBox,
                    "Dolor sea takimata ipsum sea eirmod aliquyam est. Eos ipsum voluptua eirmod elitr, no dolor dolor amet eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt. Elitr lorem eirmod dolore clita. Rebum."
                        .text
                        .color(Theme.of(context).colorScheme.tertiary)
                        .textStyle(context.captionStyle)
                        .make()
                        .p32()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
