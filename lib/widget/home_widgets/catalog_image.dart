import 'package:begetter/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String imageUrl;

  const CatalogImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
    ).box.roundedLg.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
// This widget displays an image from a network URL, rounded and padded.
