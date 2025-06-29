import 'package:begetter/models/catalog.dart';
import 'package:begetter/widget/home_widgets/catalog_header.dart';
import 'package:begetter/widget/home_widgets/catalog_list.dart';
import 'package:begetter/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatefulWidget {
  final Item catalog;
  HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeDetailPage> {
  final int days = 30;

  final String name = "Codepur";
  Item get catalog => widget.catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
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
            ).wh(100, 50)
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
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.description.text
                        .textStyle(context.captionStyle)
                        .xl
                        .make(),
                    10.heightBox,
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
