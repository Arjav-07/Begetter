import 'package:begetter/models/catalog.dart';
import 'package:begetter/pages/home_detail_page.dart';
import 'package:begetter/pages/home_page.dart';
// Ensure that 'lib/pages/home_detail_page.dart' exists and contains:
// class HomeDetailPage extends StatelessWidget { ... }
import 'package:begetter/widget/home_widgets/catalog_image.dart';
import 'package:begetter/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
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

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

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
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.description.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Buy".text.white.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}
