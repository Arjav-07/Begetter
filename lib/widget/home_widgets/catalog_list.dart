import 'package:begetter/models/cart.dart';
import 'package:begetter/models/catalog.dart';
import 'package:begetter/pages/home_detail_page.dart';
import 'package:begetter/widget/home_widgets/add_to_cart.dart';
import 'package:begetter/widget/home_widgets/catalog_image.dart';
import 'package:begetter/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              imageUrl: catalog.imageUrl,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(Theme.of(context).colorScheme.primary)
                    .bold
                    .make(),
                catalog.description.text
                    .color(Theme.of(context).colorScheme.tertiary)
                    .textStyle(context.captionStyle)
                    .make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}"
                        .text
                        .color(Theme.of(context).colorScheme.primary)
                        .bold
                        .size(18)
                        .make(),
                    AddToCart(
                      catalog: catalog,
                    ),
                  ],
                ).pOnly(right: 16.0)
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
